//
//  GetReviewsViewController.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol GetReviewsDisplayLogic: AnyObject {
    func displayReviews(_ viewModel: GetReviewsModels.GetReviews.ViewModel)
    func displayError(_ message: String)
}

class GetReviewsViewController: UIViewController, GetReviewsDisplayLogic {
    
    // MARK: - Private
    
    private var requestFactory: RequestFactory
    
    private var reviews: [Review] = []
    
    // MARK: - Public
    
    var interactor: GetReviewsBusinessLogic?
    var router: (NSObjectProtocol & GetReviewsRoutingLogic & GetReviewsDataPassing)?
    
    lazy var contentView: GetReviewsView = {
        return GetReviewsView()
    }()
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
        GetReviewsConfigurator.setup(viewController: self, requestFactory: requestFactory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        view = contentView
        getReviews()
    }
    
    // MARK: - Get reviews
    
    func getReviews() {
        let request = GetReviewsModels.GetReviews.Request(pageNumber: 1)
        interactor?.getReviews(request: request)
    }
    
    // MARK: - GetReviewsDisplayLogic
    
    func displayReviews(_ viewModel: GetReviewsModels.GetReviews.ViewModel) {
        print(viewModel)
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
