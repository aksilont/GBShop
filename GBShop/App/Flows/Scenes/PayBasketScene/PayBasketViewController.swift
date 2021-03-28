//
//  PayBasketViewController.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol PayBasketDisplayLogic: AnyObject {
    func displaySomething(viewModel: PayBasketModels.PayBasket.ViewModel)
}

class PayBasketViewController: UIViewController, PayBasketDisplayLogic {
    
    // MARK: - Public
    
    var interactor: PayBasketBusinessLogic?
    var router: (NSObjectProtocol & PayBasketRoutingLogic & PayBasketDataPassing)?
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        PayBasketConfigurator.setup(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        view.backgroundColor = .systemGreen
        doSomething()
    }
    
    // MARK: - Do something
    
    func doSomething() {
        let request = PayBasketModels.PayBasket.Request()
        interactor?.doSomething(request: request)
    }
    
    // MARK: - PayBasketDisplayLogic
    
    func displaySomething(viewModel: PayBasketModels.PayBasket.ViewModel) {
    }
}
