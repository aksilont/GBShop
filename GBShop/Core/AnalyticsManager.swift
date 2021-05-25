//
//  AnalyticsManager.swift
//  GBShop
//
//  Created by Aksilont on 24.05.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

class AnalyticsManager {
    static let shared: AnalyticsManager = AnalyticsManager()
    private init() {}
}

// MARK: - Firebase Analytics
import FirebaseAnalytics

extension AnalyticsManager {
    
    func trackSignIn(_ method: String) {
        Analytics.logEvent(AnalyticsEventLogin, parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
    func trackSignInFail(_ method: String) {
        Analytics.logEvent("login_fail", parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
    func trackLogout(_ method: String) {
        Analytics.logEvent("logout", parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
    func trackSignUp(_ method: String) {
        Analytics.logEvent("sign_up", parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
    func trackCatalogData(_ method: String) {
        Analytics.logEvent("catalog", parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
    func trackViewItem(item: String, value: Double) {
        Analytics.logEvent(AnalyticsEventViewItem, parameters: [
            AnalyticsParameterCurrency: "RUB",
            AnalyticsParameterItems: [item],
            AnalyticsParameterValue: value
        ])
    }
    
    func trackAddToCart(item: String, value: Double) {
        Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
            AnalyticsParameterCurrency: "RUB",
            AnalyticsParameterItems: [item],
            AnalyticsParameterValue: value
        ])
    }
    
    func trackDeleteFromCart(itemId: String) {
        Analytics.logEvent("delete_from_cart", parameters: [
            "item_id": itemId
        ])
    }
    
    func trackPayBasket(_ method: String) {
        Analytics.logEvent("pay_basket", parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
    func trackGetReviews(_ method: String) {
        Analytics.logEvent("get_reviews", parameters: [
            AnalyticsParameterMethod: method
        ])
    }
    
}
