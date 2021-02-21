//
//  AppDelegate.swift
//  GBShop
//
//  Created by Aksilont on 13.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory(
        baseUrl: URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    )

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
        //Authorize
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { (response) in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //Sign up
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.signUp(id: "1", userName: "Tom", password: "123", email: "some@some.ru", gender: "male", creditCard: "9872389-2424-234224-234", bio: "Some biography") { (response) in
            switch response.result {
            case .success(let signUp):
                print(signUp)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //Logout
        let logout = requestFactory.makeLogoutFactory()
        logout.logout(id: "5") { (response) in
            switch response.result {
            case .success(let signUp):
                print(signUp)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //Change user data
        let changeUserData = requestFactory.makeChangeUserDataFactory()
        changeUserData.changeUserData(id: "10", userName: "Alice", password: "qwe", email: "some@some.ru", gender: "female", creditCard: "123-456-233-123", bio: "Some biography") { (response) in
            switch response.result {
            case .success(let changeUserData):
                print(changeUserData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        */
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

