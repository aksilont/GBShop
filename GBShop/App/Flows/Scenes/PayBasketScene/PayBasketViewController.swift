//
//  PayBasketViewController.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol PayBasketDisplayLogic: AnyObject {
    func displayPayBasket(_ viewModel: PayBasketModels.PayBasket.ViewModel)
    func displayError(_ message: String)
}

class PayBasketViewController: UIViewController, PayBasketDisplayLogic {
    
    // MARK: - Public
    
    var requestFactory: RequestFactory?
    
    var interactor: PayBasketBusinessLogic?
    var router: (NSObjectProtocol & PayBasketRoutingLogic & PayBasketDataPassing)?
    
    var contentView: PayBasketView = {
       return PayBasketView()
    }()
    
    // MARK: - Init
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        PayBasketConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    func setupUI() {
        contentView.actionConfirmButton = { [weak self] in
            let request = PayBasketModels.PayBasket.Request(userId: 123)
            self?.interactor?.payBasket(request: request)
        }
    }
    
    // MARK: - PayBasketDisplayLogic
    
    func displayPayBasket(_ viewModel: PayBasketModels.PayBasket.ViewModel) {
        router?.routeToBasket()
        print(viewModel)
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
