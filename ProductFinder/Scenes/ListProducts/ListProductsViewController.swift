//
//  ListProductsViewController.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit
import SDWebImage

protocol ListProductsDisplayLogic {
    func displayProducts(viewModel: ListProducts.Load.ViewModel)
}

class ListProductsViewController: UIViewController, ListProductsDisplayLogic {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var productSearchBar: UISearchBar!
    
    @IBOutlet weak var searchProductsLoading: UIActivityIndicatorView!
    
    var productsList = [ProductViewModel]()
    var cellWidth = UIScreen.main.bounds.width / 2
    
    var interactor: ListProductsBusinessLogic?
    var router: (NSObjectProtocol & ListProductsRoutingLogic & ListProductsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup(){
        let viewController = self
        let interactor = ListProductsInteractor()
        let presenter = ListProductsPresenter()
        let router = ListProductsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = Constants.kAppName
        
        setupView()
        loadProducts()
    }
    
    func setupView() {
        productsCollectionView.register(UINib(nibName: Constants.kProductCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.kProductCellIdentifier)
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        productSearchBar.delegate = self
        
        searchProductsLoading.hidesWhenStopped = true
        searchProductsLoading.stopAnimating()
    }
    
    // MARK: Load Products
    
    func loadProducts() {
        showLoading()
        let request = ListProducts.Load.Request()
        interactor?.loadProducts(request: request)
    }
    
    func displayProducts(viewModel: ListProducts.Load.ViewModel) {
        productsList = viewModel.productListViewModel.results
        productsCollectionView.reloadData()
        hideLoading()
    }
    
    func showLoading() {
        productsCollectionView.isHidden = true
        searchProductsLoading.startAnimating()
    }
    
    func hideLoading() {
        productsCollectionView.isHidden = false
        searchProductsLoading.stopAnimating()
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ListProductsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

// MARK: UISearchBarDelegate

extension ListProductsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        if let query = searchBar.text {
            if query.count > 3 {
                searchProducts(query: query.replacingOccurrences(of: " ", with: ""))
            }
        }
    }
    
    func searchProducts(query: String){
        showLoading()
        
        let request = ListProducts.Search.Request(query: query)
        interactor?.searchProducts(request: request)
    }
}

// MARK: UICollectionViewDataSource

extension ListProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kProductCellIdentifier, for: indexPath) as! ProductCollectionViewCell
        
        let productViewModel = productsList[indexPath.row]
        
        cell.productPriceLabel.text = productViewModel.price
        cell.productNameLabel.text = productViewModel.title
        if let productUrl = productViewModel.thumbnail {
            cell.productThumbnailImage.sd_setImage(with: URL(string: productUrl))
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension ListProductsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productId = productsList[indexPath.row].id
        router?.routeToProductDetail(with: productId)
    }
}
