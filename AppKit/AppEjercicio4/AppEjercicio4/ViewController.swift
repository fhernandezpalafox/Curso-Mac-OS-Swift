//
//  ViewController.swift
//  AppEjercicio4
//
//  Created by Felipe Hernandez on 21/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
 
  
    @IBOutlet weak var lblinformacion: NSTextField!
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var imagen: NSImageView!
    
    
    @IBAction func sliderChange(_ sender: Any) {

        lblinformacion.intValue = slider.intValue
        
        imagen.setFrameSize(NSMakeSize(CGFloat(slider.floatValue), CGFloat(slider.floatValue)))
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        slider.intValue = 25
        lblinformacion.stringValue = String(slider.intValue)
        title = "Slider"

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

