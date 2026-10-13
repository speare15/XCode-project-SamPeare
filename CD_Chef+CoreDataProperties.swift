//
//  CD_Chef+CoreDataProperties.swift
//  Celebrity Chefs
//
//  Created by Samuel Oliver Peare on 25/03/2026.
//
//

import Foundation
import CoreData


extension CD_Chef {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_Chef> {
        return NSFetchRequest<CD_Chef>(entityName: "CD_Chef")
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
    @NSManaged public var favorite: Bool

}

extension CD_Chef : Identifiable {

}
