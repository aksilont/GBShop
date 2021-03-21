//
//  HomeTableViewCell.swift
//  GBShop
//
//  Created by Aksilont on 21.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(product: Product) {
        productNameLabel.text = "Наименование: \(product.name)"
        productPrice.text = "Цена: \(product.price)"
    }
    
}
