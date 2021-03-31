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
    
    lazy private var mainStackView: UIStackView = {
        let viewFactory = ViewFactory()
        return viewFactory.createStackViewStandart()
    }()
    
    lazy private var signUpButton: UIButton = {
        let widthButton: CGFloat = 200.0
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("signUpButton", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15.0
        button.widthAnchor.constraint(equalToConstant: widthButton).isActive = true
        button.addTarget(self, action: #selector(signUpDidTap), for: .touchUpInside)
        button.accessibilityIdentifier = "confirmSignUpButton"
        return button
    }()
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
        accessibilityIdentifier = "signUpView"
        backgroundColor = .white
        addSubview(mainStackView)
        addSubview(signUpButton)
        setupConstraints()
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
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingSide),
            mainStackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            mainStackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            signUpButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: paddingBetweenUI),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
