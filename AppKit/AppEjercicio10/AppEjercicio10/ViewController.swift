//
//  ViewController.swift
//  AppEjercicio10
//
//  Created by Felipe Hernandez on 27/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

   @objc dynamic var isCasillaVerificacion : Bool = false
   @objc dynamic  var cantidad: Int = 0
    
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

