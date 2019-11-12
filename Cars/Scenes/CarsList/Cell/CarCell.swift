//
//  CarCell.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet private weak var photoView: CacheImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var modelLabel: UILabel!

    var car: Car? {
        didSet {
            guard let car = car else { return }
            
            photoView.imageUrl = car.carImageUrl
            nameLabel.text = "\(car.name)'s"
            modelLabel.text = car.modelName
        }
    }

}
