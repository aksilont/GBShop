//
//  ChangeUserDataView.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class ChangeUserDataView: UIView {
    
    // MARK: - Subviews
    
    lazy private var mainStackView: UIStackView = {
        let viewFactory = ViewFactory()
        return viewFactory.createStackViewStandart()
    }()
    
    lazy private var confirmButton: UIButton = {
        let widthButton: CGFloat = 200.0
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("confirmButton", comment: ""), for: .normal)
        button.setTitleColor(.systemGray6, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 15.0
        button.widthAnchor.constraint(equalToConstant: widthButton).isActive = true
        button.addTarget(self, action: #selector(confirmDidTap), for: .touchUpInside)
        return button
    }()

    var actionConfirmButton: (() -> Void)?
    
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
        addSubview(mainStackView)
        addSubview(confirmButton)
        setupConstraints()
    }
    
    @objc private func confirmDidTap(sender: UIButton) {
        guard let actionConfirmButton = actionConfirmButton else { return }
        actionConfirmButton()
    }
    
    private func setupConstraints() {
        let paddingSide: CGFloat = 30.0
        let paddingBetweenUI: CGFloat = 20.0
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingSide),
            mainStackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            mainStackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            confirmButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: paddingBetweenUI),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
