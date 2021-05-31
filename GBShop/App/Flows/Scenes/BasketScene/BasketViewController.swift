//
//  BasketViewController.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol BasketDisplayLogic: AnyObject {
    func displayBasket(viewModel: BasketModels.Basket.ViewModel)
    func displayDeleteFromBasket(viewModel: BasketModels.DeleteFromBasket.ViewModel)
    func displayError(_ message: String)
}

class BasketViewController: UIViewController, BasketDisplayLogic {
    
    // MARK: - Private
    
    private var basket: [BasketItem] = []
    
    // MARK: - Public
    
    var requestFactory: RequestFactory
    
    var interactor: BasketBusinessLogic?
    var router: (NSObjectProtocol & BasketRoutingLogic & BasketDataPassing)?
    
    lazy var contentView: BasketView = {
        return BasketView(frame: .zero, delegate: self)
    }()
    
    // MARK: - Init
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        BasketConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getBasket()
    }
    
    // MARK: - Setup UI
    
    func setupUI() {
        contentView.actionPayBasketButton = { [weak self] in
            self?.router?.routeToPayBasket()
        }
    }
    
    // MARK: - Get basket
    
    func getBasket() {
        let request = BasketModels.Basket.Request(userId: 123)
        interactor?.getBasket(request: request)
    }
    
    // MARK: - BasketDisplayLogic
    
    func displayBasket(viewModel: BasketModels.Basket.ViewModel) {
        print(viewModel)
        DispatchQueue.main.async {
            self.basket = viewModel.basket
            self.contentView.reloadTableData(isEmpty: (self.basket.isEmpty))
        }
    }
    
    func displayDeleteFromBasket(viewModel: BasketModels.DeleteFromBasket.ViewModel) {
        print(viewModel)
        DispatchQueue.main.async {
            self.contentView.reloadTableData(isEmpty: (self.basket.isEmpty))
        }
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}

extension BasketViewController: BasketTableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellBasket",
                                                    for: indexPath) as? BasketTableViewCell {
            cell.setup(basketItem: basket[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let request = BasketModels.DeleteFromBasket.Request(productId: basket[indexPath.row].product.id)
            interactor?.deleteFromBasket(request: request)
            basket.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
