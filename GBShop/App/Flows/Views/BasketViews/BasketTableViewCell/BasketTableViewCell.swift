//
//  BasketTableViewCell.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(basketItem: BasketItem) {
        productNameLabel.text = basketItem.product.name
        productPrice.text = NSLocalizedString("GoodsPrice", comment: "").appending(": \(basketItem.product.price)")
        productCount.text = "\(basketItem.quantity)"
        productTotal.text = "\(basketItem.product.price * basketItem.quantity)"
    }
}
