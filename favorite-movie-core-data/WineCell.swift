//
//  WineCell.swift
//  favorite-movie-core-data
//
//  Created by Eric Walters on 7/31/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit

class WineCell: UITableViewCell {

    
    @IBOutlet weak var wineTitle: UILabel!
    @IBOutlet weak var wineDesc: UILabel!
    @IBOutlet weak var wineImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wineImage.layer.cornerRadius = 2.0
        wineImage.clipsToBounds = true
    }


    func configureCell(wine: Wine) {
        wineTitle.text = wine.title
        wineDesc.text = wine.descript
        wineImage.image = wine.getWineImage()
    }

}
