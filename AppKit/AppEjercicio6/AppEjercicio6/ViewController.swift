//
//  ViewController.swift
//  AppEjercicio6
//
//  Created by Felipe Hernandez on 22/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var txtDescripcion: NSTextField!
    @IBOutlet weak var dtFecha: NSDatePicker!
    @IBOutlet weak var lbldato: NSTextField!
    
    @IBAction func mostrarInformacion(_ sender: Any) {
        
        //Formatter
        let format = DateFormatter()
        
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //Bloque 1
        
        //Toma la fecha del sistema
         /*   let fecha2: String = format.string(from: Date())
            
            let str: String = "La \("\(txtDescripcion.stringValue)") es: \("\(fecha2)")"
            
            lbldato.stringValue = String(str)
            
            lbldato.sizeToFit()
        */
        
        //Bloque 2
       
       /*   let fecha: String = format.string(from: (dtFecha.dateValue))
        
         let str = "La \("\(txtDescripcion.stringValue)") es: \(fecha)"
        
         lbldato.stringValue = String(str)
         
         lbldato.sizeToFit()
        */
        
        //Bloque 3
        let str: String = "La \("\(txtDescripcion.stringValue)") es: \("\(dtFecha.stringValue)")"
        
        lbldato.stringValue = String(str)
        
        lbldato.sizeToFit()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

