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
        return GetReviewsView(frame: .zero, delegateGetReviews: self)
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
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        DispatchQueue.main.async {
            self.reviews = viewModel.reviews
            self.title = viewModel.productName
            self.contentView.reloadTableData()
        }
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}

extension GetReviewsViewController: GetReviewsTableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellReview", for: indexPath)
        cell.textLabel?.text = reviews[indexPath.row].text
        cell.imageView?.image = UIImage(systemName: "square.and.pencil")
        return cell
    }
}
