//
//  ChangeUserDataViewController.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol ChangeUserDataDisplayLogic: AnyObject {
    func displayData(viewModel: ChangeUserDataModels.ChangeUserData.ViewModel)
}

class ChangeUserDataViewController: UIViewController, ChangeUserDataDisplayLogic {
    
    // MARK: - Private
    
    private var interactor: ChangeUserDataBusinessLogic?
    
    // MARK: - Public
    
    var router: (NSObjectProtocol & ChangeUserDataRoutingLogic & ChangeUserDataDataPassing)?
    
    lazy var contentView: ChangeUserDataView = {
        return ChangeUserDataView()
    }()
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = ChangeUserDataInteractor()
        let presenter = ChangeUserDataPresenter()
        let router = ChangeUserDataRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View Lifecycle
    
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
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = false
        
        contentView.actionConfirmButton = { [weak self] in
            let request = ChangeUserDataModels.ChangeUserData.Request(id: 123,
                                                                      userName: "123",
                                                                      password: "123",
                                                                      email: "12",
                                                                      gender: "123",
                                                                      creditCard: "123",
                                                                      bio: "123")
            self?.interactor?.changeUserData(request: request)
        }
    }
    
    // MARK: - ChangeUserDataDisplayLogic
    
    func displayData(viewModel: ChangeUserDataModels.ChangeUserData.ViewModel) {
        print(viewModel)
        if viewModel.result == 1 {
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
