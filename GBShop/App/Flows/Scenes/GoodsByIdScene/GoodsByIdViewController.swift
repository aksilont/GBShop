//
//  GoodsByIdViewController.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol GoodsByIdDisplayLogic: AnyObject {
    func displayGoodsById(_ viewModel: GoodsByIdModels.GoodsById.ViewModel)
    func displayError(_ message: String)
}

class GoodsByIdViewController: UIViewController, GoodsByIdDisplayLogic {
    
    // MARK: - Private
    
    private var requestFactory: RequestFactory
    
    // MARK: - Public
    
    var interactor: GoodsByIdBusinessLogic?
    var router: (NSObjectProtocol & GoodsByIdRoutingLogic & GoodsByIdDataPassing)?
    
    // MARK: - Init
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        GoodsByIdConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGoodsById()
    }
    
    // MARK: - Get goods by Id
    
    func getGoodsById() {
        let request = GoodsByIdModels.GoodsById.Request()
        interactor?.getGoodsById(request: request)
    }
    
    // MARK: - GoodsByIdDisplayLogic
    
    func displayGoodsById(_ viewModel: GoodsByIdModels.GoodsById.ViewModel) {
        print(viewModel)
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
