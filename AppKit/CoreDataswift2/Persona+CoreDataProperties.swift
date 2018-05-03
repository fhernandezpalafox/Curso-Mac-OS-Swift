//
//  Persona+CoreDataProperties.swift
//  CoreDataSwift
//
//  Created by Felipe Hernandez on 29/04/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona")
    }

    @NSManaged public var domicilio: String?
    @NSManaged public var edad: Int32
    @NSManaged public var estadoCivil: String?
    @NSManaged public var nombre: String?

}
