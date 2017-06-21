//
//  Model.swift
//  DeepBlue
//
//  Created by Deepak Dewani on 09/04/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.

import CoreData

class Model: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    @NSManaged var item: String?
    @NSManaged var date: String?
    //    @NSManaged var eventImage: UIImage?
    
    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
}