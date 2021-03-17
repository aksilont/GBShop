//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol SignUpDisplayLogic: AnyObject {
    func displayData(_ viewModel: SignUpModels.SignUpUser.ViewModel)
}

class SignUpViewController: UIViewController, SignUpDisplayLogic {
    
    // MARK: - Private
    
    private var interactor: SignUpBusinessLogic?

    // MARK: - Public
    
    var router: (NSObjectProtocol & SignUpRoutingLogic)?
    
    lazy var contentView: SignUpView = {
        return SignUpView()
    }()
    
    // MARK: - Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = SignUpInteractor()
        let presenter             = SignUpPresenter()
        let router                = SignUpRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: - View lifecycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }
    
     // MARK: - UI
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = false
        
        contentView.actionSignUpButton = { [weak self] in
            let request = SignUpModels.SignUpUser.Request(id: 123,
                                                          userName: "123",
                                                          password: "123",
                                                          email: "12",
                                                          gender: "123",
                                                          creditCard: "123",
                                                          bio: "123")
            self?.interactor?.signUp(request: request)
        }
    }
    
    // MARK: - SignUpDisplayLogic
    
    func displayData(_ viewModel: SignUpModels.SignUpUser.ViewModel) {
        print(viewModel)
        if viewModel.result == 1 {
            router?.routeToAuth()
        }
    }
}
