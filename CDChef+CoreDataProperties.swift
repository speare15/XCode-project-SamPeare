//
//  CDChef+CoreDataProperties.swift
//  Celebrity Chefs
//
//  Created by Samuel Oliver Peare on 24/03/2026.
//

import Foundation
import CoreData


extension CDChef {
    
    @nonobjc public class override func fetchRequest() -> NSFetchRequest<CDChef> {
        return NSFetchRequest<CDChef>(entityName: "CDChef")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var dob: String?
    @NSManaged public var restaurants: String?
    @NSManaged public var books: String?
    @NSManaged public var tv: String?
    @NSManaged public var cuisine: String?
    @NSManaged public var url: String?
    @NSManaged public var image: String?
    @NSManaged public var video: String?
    
    
}

extension CDChef : Identifiable {
    
}
