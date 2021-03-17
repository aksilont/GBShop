//
//  HomeViewController.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displaySomething(viewModel: HomeModels.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    
    // MARK: - Private
    
    private var interactor: HomeBusinessLogic?
    
    // MARK: - Public
    
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
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
    }
    
    // MARK: - Do something
    
    func doSomething() {
        let request = HomeModels.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    // MARK: - HomeDisplayLogic
    
    func displaySomething(viewModel: HomeModels.Something.ViewModel) {
    }
}
