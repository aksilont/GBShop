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
    
    private var mainStackView = UIStackView()
    
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
        
        addMainStackView()
        addSignUpButton()
        setupConstraints()
    }
    
    private func addMainStackView() {
        let viewFactory = ViewFactory()
        mainStackView = viewFactory.createStackViewStandart()
        addSubview(mainStackView)
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
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingSide),
            mainStackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            mainStackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            signUpButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: paddingBetweenUI),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
