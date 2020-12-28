//
//  Contact+CoreDataProperties.swift
//  Contact Book
//
//  Created by Mariam on 12/28/20.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: String?

}

extension Contact : Identifiable {

}
