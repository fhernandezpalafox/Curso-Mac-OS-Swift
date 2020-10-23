//
//  ViewController.swift
//  AppEjercicio7
//
//  Created by Felipe Hernandez on 22/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource  {
    
    @IBOutlet weak var tabla: NSTableView!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtDomicilio: NSTextField!
    @IBOutlet weak var chkEstaCasado: NSButton!
    
    var lista = [Persona]()
    //var lista = [Any]()
    
    @IBAction func agregar(_ sender: Any) {
        
        let p = Persona()
        
        p.Nombre = txtNombre.stringValue
        p.Domicilio = txtDomicilio.stringValue
        p.estaCasado =  Int(chkEstaCasado.intValue)
        
        lista.append(p)
        
        tabla.reloadData()
        
        
        //limpiar las cajas
        txtNombre.stringValue = ""
        txtDomicilio.stringValue = ""
        chkEstaCasado.state = NSControl.StateValue(rawValue: 0) 
        
    }
    
    @IBAction func eliminar(_ sender: Any) {
    
        let row: Int =  self.tabla.selectedRow // self = this
        
        if row != -1 {
             lista.remove(at: row)
             tabla.reloadData()
        }else {
            print("Error")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Persona()
        p.Nombre = "Felipe"
        p.Domicilio = "Betania #1616 col san felipe"
        p.estaCasado = 1
        
        lista.append(p)
        
        //Recargar la tabla
        tabla.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

  
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return lista.count
    }
    

    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        
      let p: Persona? = lista[row]
        
        let identifier : String = tableColumn!.identifier.rawValue
        
        let columna = p?.value(forKey: identifier)
        
        return columna
        

    }  

}

