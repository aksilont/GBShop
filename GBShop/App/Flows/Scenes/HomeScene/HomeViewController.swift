//
//  HomeViewController.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayCatalogData(_ viewModel: HomeModels.CatalogData.ViewModel)
    func displayError(_ message: String)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    
    // MARK: - Private
    
    private var products: [Product] = []
    
    // MARK: - Public
    
    var requestFactory: RequestFactory
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Init
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        HomeConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        catalogData()
    }
    
    // MARK: - Do something
    
    func catalogData() {
        let request = HomeModels.CatalogData.Request(pageNumber: "1", categoryId: "1")
        interactor?.catalogData(request: request)
    }
    
    // MARK: - HomeDisplayLogic
    
    func displayCatalogData(_ viewModel: HomeModels.CatalogData.ViewModel) {
        DispatchQueue.main.async {
            self.products = viewModel.products
            self.tableView.reloadData()
        }
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        cell.setup(product: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Goods", comment: "")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.routeToGoodsById()
    }
    
}
