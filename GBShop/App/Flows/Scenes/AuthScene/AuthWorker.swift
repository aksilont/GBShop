//
//  AuthWorker.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import Foundation

class AuthWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func loginUser(userName: String, password: String, completion: @escaping(LoginResult) -> Void) {
        let auth = requestFactory.makeAuthRequestFactory()
        
        auth.login(userName: userName, password: password) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logoutUser(userId: String, completion: @escaping(LogoutResult) -> Void) {
        let logoutFactory = requestFactory.makeLogoutFactory()
        
        logoutFactory.logout(id: userId) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
