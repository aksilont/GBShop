//
//  HomeWorker.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class HomeWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func catalogData(pageNumber: String, categoryId: String, completion: @escaping(CatalogDataResult) -> Void) {
        
        let catatlogData = requestFactory.makeCatalogDataFactory()
        
        catatlogData.getData(pageNumber: pageNumber, categoryId: categoryId) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
