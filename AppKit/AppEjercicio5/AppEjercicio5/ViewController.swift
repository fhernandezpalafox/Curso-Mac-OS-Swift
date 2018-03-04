//
//  ViewController.swift
//  AppEjercicio5
//
//  Created by Felipe Hernandez on 21/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //@objc =  Inferencia, quiere decir que este esta sujeto a que objc utilice la setencia funcion o propiedad para que lo tome en cuenta.

    @objc dynamic var numero: Int = 1
    @objc dynamic var color: NSColor = NSColor.black
    @objc dynamic var Habilitar : Bool = false
    
    @IBOutlet weak var txtSelecionado: NSTextField!
    
    @IBAction func seleccionar(_ sender: Any) {
        
        switch (sender as! NSSegmentedControl).selectedSegment {
        case 0:
            txtSelecionado.stringValue = "Se selecciono hombre"
            break
        case 1:
            txtSelecionado.stringValue = "Se selecciono mujer"
            break
        case 2:
            txtSelecionado.stringValue = "Se selecciono niño"
            break
        default:
            break
        }
    }

        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //title = "Otros componentes"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

