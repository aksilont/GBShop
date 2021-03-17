//
//  AuthViewController.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import UIKit

protocol AuthDisplayLogic: AnyObject {
    func displayUser(_ viewModel: AuthModels.LoginUser.ViewModel)
    func displayLogoutUser(_ viewModel: AuthModels.LogoutUser.ViewModel)
}

final class AuthViewController: UIViewController, AuthDisplayLogic {
    
    // MARK: - Private
    
    private var interactor: AuthBisnessLogic?
    
    // MARK: - Public
    
    var router: (AuthRoutingLogic & AuthDataPassing)?
    
    var contentView: AuthView {
        return view as! AuthView
    }
    
    var profile = false
    
    // MARK: - Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = AuthInteractor()
        let presenter             = AuthPresenter()
        let router                = AuthRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        view = AuthView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
        navigationController?.navigationBar.isHidden = true
        
        contentView.createView(profile: profile)
        
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
    
    func checkToProfile() {
        profile = true
        DispatchQueue.main.async {
            self.contentView.createView(profile: true)
        }
    }
    
    func checkToAuth() {
        profile = false
        DispatchQueue.main.async {
            self.contentView.createView(profile: false)
        }
    }
    
    func displayUser(_ viewModel: AuthModels.LoginUser.ViewModel) {
        print(viewModel)
        if viewModel.result == 1 {
            checkToProfile()
        }
    }
    
    func displayLogoutUser(_ viewModel: AuthModels.LogoutUser.ViewModel) {
        print(viewModel)
        if viewModel.result == 1 {
            checkToAuth()
        }
    }
}
