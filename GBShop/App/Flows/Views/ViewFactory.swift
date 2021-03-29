//
//  ViewFactory.swift
//  GBShop
//
//  Created by Aksilont on 17.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class ViewFactory {
    
    // MARK: - Create Stack View
    
    func createStackViewStandart() -> UIStackView {
        let fields: [String] = [
            "Login",
            "Password",
            "E-mail",
            "Gender",
            "Credit card",
            "Bio"
        ]
        return createStackView(fields: fields)
    }
 
    func createStackView(fields: [String]) -> UIStackView {
        let paddingBetweenUI: CGFloat = 20.0
        
        let stackView = UIStackView(arrangedSubviews: fields.map { createStackView(label: $0) })
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = paddingBetweenUI
        
        return stackView
    }
    
    func createStackView(label: String) -> UIStackView {
        let widthLabel: CGFloat = 150.0
        
        let newLabel = UILabel()
        newLabel.textAlignment = .right
        newLabel.text = NSLocalizedString(label, comment: "")
        newLabel.widthAnchor.constraint(equalToConstant: widthLabel).isActive = true
        
        let newTextField = UITextField()
        newTextField.borderStyle = .roundedRect
        newTextField.textColor = .black
        newTextField.autocorrectionType = .no
        
        let newStack = UIStackView(arrangedSubviews: [newLabel, newTextField])
        newStack.translatesAutoresizingMaskIntoConstraints = false
        newStack.axis = .horizontal
        newStack.spacing = 20.0
        
        return newStack
    }
    
}
