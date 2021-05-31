//
//  AuthView.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class AuthView: UIView {
    
    // MARK: - Auth subviews
    
    lazy private var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.placeholder = NSLocalizedString("Login", comment: "")
        textField.accessibilityIdentifier = "userName"
        textField.becomeFirstResponder()
        return textField
    }()
    
    lazy private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.placeholder = NSLocalizedString("Password", comment: "")
        textField.accessibilityIdentifier = "password"
        return textField
    }()
    
    lazy private var authButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("authButton", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(authDidTap), for: .touchUpInside)
        button.accessibilityIdentifier = "authButton"
        return button
    }()
    var actionAuthButton: ((String, String) -> Void)?
    
    lazy private var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("signUpButton", comment: ""), for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(signUpDidTap), for: .touchUpInside)
        button.accessibilityIdentifier = "singUpButton"
        return button
    }()
    var actionSignUpButton: (() -> Void)?
    
    // MARK: - Profile subviews
    
    lazy private var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = NSLocalizedString("Hello user!", comment: "")
        return label
    }()
    
    lazy private var changeUserDataButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("changeUserDataButton", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15.0
        button.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        button.addTarget(self, action: #selector(changeUserDataDidTap), for: .touchUpInside)
        return button
    }()
    var actionChangeUserDataButton: (() -> Void)?
    
    lazy private var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("logoutButton", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15.0
        button.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        button.addTarget(self, action: #selector(logoutDidTap), for: .touchUpInside)
        return button
    }()
    var actionLogoutButton: (() -> Void)?
    
    var userName: String {
        guard let userName = userNameTextField.text else { return "" }
        return userName
    }
    
    var password: String {
        guard let password = passwordTextField.text else { return "" }
        return password
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI Initialize
    
    func reloadView(profile: Bool = false) {
        for elements in subviews {
            elements.removeFromSuperview()
        }
        if profile {
            configureUIProfile()
        } else {
            configureUI()
        }
    }
    
    // MARK: - UI Auth
    
    private func configureUI() {
        accessibilityIdentifier = "authView"
        backgroundColor = .white
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        addSubview(authButton)
        addSubview(signUpButton)
        setupConstraints()
    }
    
    @objc private func authDidTap(sender: UIButton) {
        guard let actionAuthButton = actionAuthButton else { return }
        actionAuthButton(userName, password)
    }
    
    @objc private func signUpDidTap(sender: UIButton) {
        guard let actionSignUpButton = actionSignUpButton else { return }
        actionSignUpButton()
    }
    
    private func setupConstraints() {
        let paddingTop: CGFloat = 100.0
        let paddingBetweenUI: CGFloat = 20.0
        let width: CGFloat = 150.0
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingTop),
            userNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameTextField.widthAnchor.constraint(equalToConstant: width),
            
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: paddingBetweenUI),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: width),
            
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: paddingBetweenUI),
            authButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            authButton.widthAnchor.constraint(equalToConstant: width),
            
            signUpButton.topAnchor.constraint(equalTo: authButton.bottomAnchor, constant: paddingBetweenUI),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: width)
            ])
    }
    
    // MARK: - UI Profile
    
    private func configureUIProfile() {
        accessibilityIdentifier = "profileView"
        backgroundColor = .white
        addSubview(helloLabel)
        addSubview(changeUserDataButton)
        addSubview(logoutButton)
        setupConstraintsProfile()
    }
    
    @objc private func changeUserDataDidTap(sender: UIButton) {
        guard let actionChangeUserDataButton = actionChangeUserDataButton else { return }
        actionChangeUserDataButton()
    }
    
    @objc private func logoutDidTap(sender: UIButton) {
        guard let actionLogoutButton = actionLogoutButton else { return }
        actionLogoutButton()
    }
    
    private func setupConstraintsProfile() {
        let paddingSide: CGFloat = 50.0
        let paddingBetweenUI: CGFloat = 20.0
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingSide),
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            changeUserDataButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: paddingBetweenUI),
            changeUserDataButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: changeUserDataButton.bottomAnchor, constant: paddingBetweenUI),
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
