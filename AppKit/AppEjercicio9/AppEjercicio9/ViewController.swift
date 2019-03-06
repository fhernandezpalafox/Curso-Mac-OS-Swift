//
//  ViewController.swift
//  AppEjercicio9
//
//  Created by Felipe Hernandez on 27/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
   @IBOutlet weak var lista: NSPopUpButton!
    @IBOutlet weak var popUp: NSPopUpButton!
    @IBOutlet weak var txtItem: NSTextField!
    @IBOutlet weak var lblInformacion: NSTextField!
 
    
    @IBAction func agregar(_ sender: Any) {
        
        popUp.addItem(withTitle: "\(txtItem.stringValue)")
        
        txtItem.stringValue = ""
        
    }
    
    @IBAction func cambia(_ sender: Any) {
       
        lblInformacion.stringValue = popUp.titleOfSelectedItem!
        lblInformacion.sizeToFit()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nombres = ["Juan", "Pedro", "Oscar"]
        lista.addItems(withTitles: nombres)
        lista.menu?.insertItem(NSMenuItem.separator(), at: 2)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

