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
    func displayError(_ message: String)
}

class SignUpViewController: UIViewController, SignUpDisplayLogic {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory

    // MARK: - Public
    
    var interactor: SignUpBusinessLogic?
    var router: (NSObjectProtocol & SignUpRoutingLogic)?
    
    lazy var contentView: SignUpView = {
        return SignUpView()
    }()
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
        SignUpConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        print(viewModel.messsage ?? "")
        router?.routeToAuth()
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
