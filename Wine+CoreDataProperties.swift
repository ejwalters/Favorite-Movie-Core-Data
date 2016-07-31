//
//  Wine+CoreDataProperties.swift
//  favorite-movie-core-data
//
//  Created by Eric Walters on 7/31/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Wine {

    @NSManaged var image: NSData?
    @NSManaged var url: String?
    @NSManaged var descript: String?
    @NSManaged var title: String?

}
