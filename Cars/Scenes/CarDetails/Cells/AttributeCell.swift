//
//  AttributeCell.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 12/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell {

    func set(title: String, value: String) {
        textLabel?.text = title
        detailTextLabel?.text = value
    }

}
