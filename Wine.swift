//
//  Wine.swift
//  favorite-movie-core-data
//
//  Created by Eric Walters on 7/31/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Wine: NSManagedObject {


    func setWineImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getWineImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
