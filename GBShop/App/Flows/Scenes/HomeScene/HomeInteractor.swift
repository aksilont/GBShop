//
//  HomeInteractor.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol HomeBusinessLogic {
    func doSomething(request: HomeModels.Something.Request)
}

protocol HomeDataStore {
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    // MARK: - Public
    
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    // MARK: - HomeBusinessLogic
    
    func doSomething(request: HomeModels.Something.Request) {
        worker = HomeWorker()
        worker?.doSomeWork()
        
        let response = HomeModels.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
