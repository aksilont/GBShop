//
//  AddToBasketView.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class AddToBasketView: UIView {
    
    // MARK: - Subviews
    
    private let widthLabel: CGFloat = 150.0
    
    lazy private var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Добавить выбранный товар в корзину?"
        return label
    }()
    
    lazy private var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = NSLocalizedString("Quantity", comment: "")
        label.widthAnchor.constraint(equalToConstant: widthLabel).isActive = true
        return label
    }()
    
    lazy private var quantityTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        return textField
    }()
    
    var quantity: Int {
        guard let quantity = quantityTextField.text else { return 1 }
        return Int(quantity) ?? 1
    }
    
    lazy private var quantityStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, quantityTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20.0
        return stackView
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
    
    var actionConfirmButton: ((Int) -> Void)?
    
    lazy private var cancelButton: UIButton = {
        let widthButton: CGFloat = 200.0
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("cancelButton", comment: ""), for: .normal)
        button.setTitleColor(.systemGray6, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15.0
        button.widthAnchor.constraint(equalToConstant: widthButton).isActive = true
        button.addTarget(self, action: #selector(cancelDidTap), for: .touchUpInside)
        return button
    }()
    
    var actionCancelButton: (() -> Void)?
    
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
        addSubview(questionLabel)
        addSubview(quantityStack)
        addSubview(confirmButton)
        addSubview(cancelButton)
        setupConstraints()
    }
    
    @objc private func confirmDidTap(sender: UIButton) {
        guard let actionConfirmButton = actionConfirmButton else { return }
        actionConfirmButton(quantity)
    }
    
    @objc private func cancelDidTap(sender: UIButton) {
        guard let actionCancelButton = actionCancelButton else { return }
        actionCancelButton()
    }
    
    private func setupConstraints() {
        let paddingSide: CGFloat = 50.0
        let paddingBetweenUI: CGFloat = 20.0
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: paddingSide),
            questionLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            questionLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            quantityStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: paddingBetweenUI),
            quantityStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: paddingSide),
            quantityStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -paddingSide),
            
            confirmButton.topAnchor.constraint(equalTo: quantityStack.bottomAnchor, constant: paddingBetweenUI),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: paddingBetweenUI),
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
