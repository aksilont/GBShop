//
//  AddToBasketViewController.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol AddToBasketDisplayLogic: AnyObject {
    func displayAddToBasket(viewModel: AddToBasketModels.AddToBasket.ViewModel)
    func displayError(message: String)
}

class AddToBasketViewController: UIViewController, AddToBasketDisplayLogic {
    
    // MARK: - Public
    
    var requestFactory: RequestFactory?
    
    var interactor: AddToBasketBusinessLogic?
    var router: (NSObjectProtocol & AddToBasketRoutingLogic & AddToBasketDataPassing)?
    
    var contentView: AddToBasketView = {
        return AddToBasketView()
    }()
    
    // MARK: - Init
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        AddToBasketConfigurator.setup(viewController: self, requestFactory: requestFactory)
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
        contentView.actionConfirmButton = { [weak self] (quantity) in
            self?.addToBasket(quantity: quantity)
            self?.dismiss(animated: true, completion: nil)
        }
        contentView.actionCancelButton = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Add to basket
    
    func addToBasket(quantity: Int) {
        guard let productId = router?.dataStore?.productId else { return }
        let request = AddToBasketModels.AddToBasket.Request(productId: productId, quantity: quantity)
        interactor?.addToBasket(request: request)
    }
    
    // MARK: - AddToBasketDisplayLogic
    
    func displayAddToBasket(viewModel: AddToBasketModels.AddToBasket.ViewModel) {
        print(viewModel)
    }
    
    func displayError(message: String) {
        print(message)
    }
}
