//
//  AuthViewController.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import UIKit

protocol AuthDisplayLogic: AnyObject {
    func displayUser(_ viewModel: AuthModels.LoginUser.ViewModel)
    func displayLogoutUser(_ message: String)
    func displayError(_ message: String)
}

final class AuthViewController: UIViewController, AuthDisplayLogic {
    
    // MARK: - Public
    
    let requestFactory: RequestFactory
    
    var interactor: AuthBisnessLogic?
    var router: (AuthRoutingLogic & AuthDataPassing)?
    
    lazy var contentView: AuthView = {
        return AuthView()
    }()
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
        AuthConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    // MARK: - UI
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            contentView.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private func setupUI() {
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        contentView.reloadView(profile: isLogin)
        
        contentView.actionAuthButton = { [weak self] (userName, password) in
            let request = AuthModels.LoginUser.Request(userName: userName, password: password)
            self?.interactor?.loginUser(request)
        }
        contentView.actionSignUpButton = { [weak self] in
            self?.router?.routeToSignUp()
        }
        contentView.actionChangeUserDataButton = { [weak self] in
            self?.router?.routeToChangeUserData()
        }
        contentView.actionLogoutButton = { [weak self] in
            let request = AuthModels.LogoutUser.Request(userId: 123)
            self?.interactor?.logoutUser(request)
        }
    }
    
    // MARK: - AuthDisplayLogic
    
    func displayUser(_ viewModel: AuthModels.LoginUser.ViewModel) {
        print(viewModel.user)
        DispatchQueue.main.async {
            UserDefaults.standard.setValue(true, forKey: "isLogin")
            self.contentView.reloadView(profile: true)
        }
    }
    
    func displayLogoutUser(_ message: String) {
        print(message)
        DispatchQueue.main.async {
            UserDefaults.standard.setValue(false, forKey: "isLogin")
            self.contentView.reloadView(profile: false)
        }
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
