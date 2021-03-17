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
    
    private var mainStackView = UIStackView()
    
    private let confirmButton = UIButton()
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
        
        addMainStackView()
        addChangeUserDataButton()
        setupConstraints()
    }
    
    private func addMainStackView() {
        let viewFactory = ViewFactory()
        mainStackView = viewFactory.createStackViewStandart()
        addSubview(mainStackView)
    }
    
    private func addChangeUserDataButton() {
        let widthButton: CGFloat = 200.0
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle(NSLocalizedString("confirmButton", comment: ""), for: .normal)
        confirmButton.setTitleColor(.systemGray6, for: .normal)
        confirmButton.backgroundColor = .systemIndigo
        confirmButton.layer.cornerRadius = 15.0
        confirmButton.widthAnchor.constraint(equalToConstant: widthButton).isActive = true
        confirmButton.addTarget(self, action: #selector(confirmDidTap), for: .touchUpInside)
        addSubview(confirmButton)
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
