//
//  Modelo.swift
//  AppEjercicio17
//
//  Created by Felipe Hernandez on 25/04/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa


class Departamento: NSObject {
    let nombre:String
    var cuentas: [Cuenta] = []
    let icono:NSImage?
    
    init (nombre:String,icono:NSImage?){
        self.nombre = nombre
        self.icono = icono
    }
}

class Cuenta: NSObject {
    let nombre:String
    var empleados: [Empleado] = []
    let icono:NSImage?
    
    init (nombre:String,icono:NSImage?){
        self.nombre = nombre
        self.icono = icono
    }
}

class Empleado: NSObject {
    let nombre:String
    let apellido:String
    let icono:NSImage?
    let correo:String
    
    init (nombre:String, apellido:String, icono:NSImage?, correo:String){
        self.nombre = nombre
        self.apellido = apellido
        self.icono = icono
        self.correo = correo
    }
}

