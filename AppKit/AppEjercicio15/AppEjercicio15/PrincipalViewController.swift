//
//  PrincipalViewController.swift
//  AppEjercicio15
//
//  Created by Felipe Hernandez on 01/03/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class PrincipalViewController: NSViewController {

    @IBOutlet weak var lblDato: NSTextField!
    
    var usuario : String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        lblDato.stringValue = "Bienvenido \(usuario)"
    }
    
}









