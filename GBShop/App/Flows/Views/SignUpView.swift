//
//  SignUpView.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    // MARK: - Subviews

    private var userNameStack = UIStackView()
    private var passwordStack = UIStackView()
    private var emailStack = UIStackView()
    private var genderStack = UIStackView()
    private var creditCardStack = UIStackView()
    private var bioStack = UIStackView()
    
    private let signUpButton = UIButton()
    var actionSignUpButton: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        backgroundColor = .white
        configStackView(&userNameStack, label: "Login")
        configStackView(&passwordStack, label: "Password")
        configStackView(&emailStack, label: "E-mail")
        configStackView(&genderStack, label: "Gender")
        configStackView(&creditCardStack, label: "Credit card")
        configStackView(&bioStack, label: "Bio")
        addSignUpButton()
        setupConstraints()
    }
    
    private func configStackView(_ stackView: inout UIStackView, label: String) {
        stackView = createStackView(label: label)
        addSubview(stackView)
    }
    
    private func createStackView(label: String) -> UIStackView {
        let widthLabel: CGFloat = 150.0
        
        let newLabel = UILabel()
        newLabel.textAlignment = .right
        newLabel.text = NSLocalizedString(label, comment: "")
        newLabel.widthAnchor.constraint(equalToConstant: widthLabel).isActive = true
        
        let newTextField = UITextField()
        newTextField.borderStyle = .roundedRect
        newTextField.textColor = .black
        
        let newStack = UIStackView(arrangedSubviews: [newLabel, newTextField])
        newStack.translatesAutoresizingMaskIntoConstraints = false
        newStack.axis = .horizontal
        newStack.spacing = 20.0
        newStack.alignment = .fill
        newStack.distribution = .fillProportionally
        
        return newStack
    }
    
    private func addSignUpButton() {
        let widthButton: CGFloat = 200.0
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle(NSLocalizedString("signUpButton", comment: ""), for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = .systemPink
        signUpButton.layer.cornerRadius = 15.0
        signUpButton.widthAnchor.constraint(equalToConstant: widthButton).isActive = true
        signUpButton.addTarget(self, action: #selector(signUpDidTap), for: .touchUpInside)
        addSubview(signUpButton)
    }
    
    @objc private func signUpDidTap(sender: UIButton) {
        guard let actionSignUpButton = actionSignUpButton else { return }
        actionSignUpButton()
    }
    
    private func setupConstraints() {
        let paddingSide: CGFloat = 30.0
        let paddingBetweenUI: CGFloat = 20.0
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            userNameStack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingSide),
            userNameStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            userNameStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            passwordStack.topAnchor.constraint(equalTo: userNameStack.bottomAnchor, constant: paddingBetweenUI),
            passwordStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            passwordStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            emailStack.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: paddingBetweenUI),
            emailStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            emailStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            genderStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: paddingBetweenUI),
            genderStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            genderStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            creditCardStack.topAnchor.constraint(equalTo: genderStack.bottomAnchor, constant: paddingBetweenUI),
            creditCardStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            creditCardStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            bioStack.topAnchor.constraint(equalTo: creditCardStack.bottomAnchor, constant: paddingBetweenUI),
            bioStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            bioStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            signUpButton.topAnchor.constraint(equalTo: bioStack.bottomAnchor, constant: paddingBetweenUI),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
