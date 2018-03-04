//
//  ViewController.swift
//  AppEjercicio1
//
//  Created by Felipe Hernandez on 14/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var txtNum1: NSTextField!
    @IBOutlet weak var txtNum2: NSTextField!
    @IBOutlet weak var lblResultado: NSTextField!
    
    @IBAction func Operacion(_ sender: Any) {
        //Creacion de variables
        var num1 : Int32
        var num2 : Int32
        var resultado : Int32

        //Realizacion de las operaciones
        num1 = txtNum1.intValue
        num2 = txtNum2.intValue
        resultado = num1 / num2
        lblResultado.stringValue = String(resultado)
        
        
        //Usando clases
        let operaciones = Operaciones()
        let resultado2 = operaciones.sumar(a:num1,num2)
        print("El resultado es \(resultado2)")
  
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

