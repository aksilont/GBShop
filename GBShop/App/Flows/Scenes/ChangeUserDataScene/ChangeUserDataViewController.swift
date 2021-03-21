//
//  ChangeUserDataViewController.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol ChangeUserDataDisplayLogic: AnyObject {
    func displayData(_ viewModel: ChangeUserDataModels.ChangeUserData.ViewModel)
    func displayError(_ message: String)
}

class ChangeUserDataViewController: UIViewController, ChangeUserDataDisplayLogic {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Public
    var interactor: ChangeUserDataBusinessLogic?
    var router: (NSObjectProtocol & ChangeUserDataRoutingLogic & ChangeUserDataDataPassing)?
    
    lazy var contentView: ChangeUserDataView = {
        return ChangeUserDataView()
    }()
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
        ChangeUserDataConfigure.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    // MARK: - UI
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = false
        
        contentView.actionConfirmButton = { [weak self] in
            let request = ChangeUserDataModels.ChangeUserData.Request(id: 123,
                                                                      userName: "123",
                                                                      password: "123",
                                                                      email: "",
                                                                      gender: "123",
                                                                      creditCard: "123",
                                                                      bio: "123")
            self?.interactor?.changeUserData(request: request)
        }
    }
    
    // MARK: - ChangeUserDataDisplayLogic
    
    func displayData(_ viewModel: ChangeUserDataModels.ChangeUserData.ViewModel) {
        DispatchQueue.main.async {
            print(viewModel.message ?? "")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
