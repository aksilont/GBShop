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
    
    private var requestFactory: RequestFactory
    
    private var products: [Product] = []
    
    // MARK: - Public
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Init
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        HomeConfigure.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
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
        products = viewModel.products
        DispatchQueue.main.async {
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
    
}
