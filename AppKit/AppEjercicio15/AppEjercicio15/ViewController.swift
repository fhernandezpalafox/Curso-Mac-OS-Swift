//
//  ViewController.swift
//  AppEjercicio15
//
//  Created by Felipe Hernandez on 01/03/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var txtPassword: NSSecureTextField!
    
    @IBOutlet weak var txtUsuario: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onLogin(_ sender: Any) {
        
        if txtUsuario.stringValue == "felipe" && txtPassword.stringValue == "fe"
        {
        
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: Bundle.main)
            
let controller = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Principal")) as? PrincipalViewController
            
            
            controller?.usuario = txtUsuario.stringValue
            
            
            if let aController = controller {
                controller?.presentViewControllerAsModalWindow(aController)
            }
        }
    }
    
    
    
    
    
}

