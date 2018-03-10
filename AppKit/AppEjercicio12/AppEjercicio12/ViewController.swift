//
//  ViewController.swift
//  AppEjercicio12
//
//  Created by Felipe Hernandez on 27/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var PersonasArray: NSArrayController!
    @IBOutlet weak var tabla: NSTableView!
    @IBOutlet weak var txtDomicilio: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    
    @IBAction func Agregar(_ sender: Any){
        
        let nombre : String = txtNombre.stringValue
        
        let domicilio : String = txtDomicilio.stringValue
        
        let persona =  Persona(nombre: nombre, domicilio: domicilio)
        
        PersonasArray.addObject(persona)
        
        txtNombre.stringValue = ""
        
        txtDomicilio.stringValue = ""
        
        tabla.reloadData()
    }

    @IBAction func Eliminar(_ sender: Any) {
        
        let row: Int =  self.tabla.selectedRow
        
        if row != -1 {
             PersonasArray.remove(atArrangedObjectIndex: row)
            
             tabla.reloadData()
        }else {
            print("Error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persona = Persona(nombre: "Felipe", domicilio:"Betania 1616, col San felipe")
        
        PersonasArray.addObject(persona)
        
        tabla.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    
    
    
    
    
    
}

