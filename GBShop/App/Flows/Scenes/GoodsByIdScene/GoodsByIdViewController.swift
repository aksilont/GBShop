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
    
    // MARK: - Public
    
    var requestFactory: RequestFactory
    
    var interactor: GoodsByIdBusinessLogic?
    var router: (NSObjectProtocol & GoodsByIdRoutingLogic & GoodsByIdDataPassing)?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
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
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "cart.badge.plus"),
                            style: .plain,
                            target: self,
                            action: #selector(addToBasket))
        ]
        
        getGoodsById()
    }
    
    @objc func addToBasket(_ sender: UIButton) {
        router?.routeToAddToBasket()
    }
    
    // MARK: - IBAction
    
    @IBAction func getReviewsDidTap() {
        router?.routeToGetReviews()
    }
    
    // MARK: - Get goods by Id
    
    func getGoodsById() {
        let request = GoodsByIdModels.GoodsById.Request()
        interactor?.getGoodsById(request: request)
    }
    
    // MARK: - GoodsByIdDisplayLogic
    
    func displayGoodsById(_ viewModel: GoodsByIdModels.GoodsById.ViewModel) {
        DispatchQueue.main.async {
            self.title = viewModel.name
            self.imageView.image = UIImage(systemName: "photo.tv")
            self.nameLabel.text = viewModel.name
            self.descriptionLabel.text = viewModel.description
            self.priceLabel.text = NSLocalizedString("Price", comment: "").appending(": \(viewModel.price)")
        }

        print(viewModel)
    }
    
    func displayError(_ message: String) {
        print(message)
    }
}
