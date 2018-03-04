//
//  ViewController.swift
//  AppEjercicio3Alumno
//
//  Created by Felipe Hernandez on 15/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var ArregloNumeros : [String:Int32] = ["uno":1,"dos":2,"tres":3,"cuatro":4,"cinco":5,"seis":6,"siete":7,"ocho":8,"nueve":9];
    
    @IBOutlet weak var lblResultado: NSTextField!
    
    @IBOutlet weak var txtNum2: NSTextField!
    
    @IBOutlet weak var txtNum1: NSTextField!
    
    @IBAction func onOperacion(_ sender: NSButton) {
        var resultado : Int32 = 0
        
        let cajaTexto1 : Int32  = convertir(param: txtNum1.stringValue.lowercased())
        
        let cajaTexto2 : Int32 = convertir(param: txtNum2.stringValue.lowercased())
        
        let boton = sender
        
        if boton.title == "Sumar" {
        
            resultado  = cajaTexto1 + cajaTexto2
            
        }else if boton.title == "Restar" {
            
            resultado  = cajaTexto1 - cajaTexto2
            
        }else if boton.title == "Multiplicar" {
            
            resultado  = cajaTexto1 * cajaTexto2
            
        }else if boton.title == "Dividir" {
            
            resultado  = cajaTexto1 / cajaTexto2
        }
        
        lblResultado.stringValue = "El resultado es \(resultado)"
    }
    
    func convertir(param: String) -> Int32 {
        
        var valor: Int32 = 0
        var paso: Bool = false
        
        for itemdiccionario in ArregloNumeros {
            if param == itemdiccionario.key {
                valor = itemdiccionario.value
                paso =  true
                break
            }
        }
    
        if paso == false {
            valor = Int32(param)!
        }
        
        return valor
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

