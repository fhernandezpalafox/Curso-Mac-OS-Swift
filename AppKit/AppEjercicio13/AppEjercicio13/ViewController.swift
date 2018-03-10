//
//  ViewController.swift
//  AppEjercicio13
//
//  Created by Felipe Hernandez on 28/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var lblDato: NSTextField!
    

    @IBAction func eventAceptar(_ sender: Any) {
        lblDato.stringValue = "Hola Mundo"
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

