//
//  Persona.swift
//  AppEjercicio12
//
//  Created by Felipe Hernandez on 27/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Foundation

@objc(Persona)
class Persona: NSObject {
    
    @objc dynamic var nombre : String
    @objc dynamic var domicilio : String
    
    init(nombre:String, domicilio:String) {
        self.nombre = nombre
        self.domicilio = domicilio
    }

}
