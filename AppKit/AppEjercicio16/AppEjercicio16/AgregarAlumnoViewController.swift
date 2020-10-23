//
//  AgregarAlumnoViewController.swift
//  AppEjercicio16
//
//  Created by Felipe Hernandez on 12/04/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class AgregarAlumnoViewController: NSViewController {

    //ViewController Principal
    var viewController = ViewController()
    
    var esModificacion = false
    
    var  datos = Datos()
    
    var row = -1
    
    
    
    @IBOutlet weak var txtTitulo: NSTextField!
    
    @IBOutlet weak var txtDescripcion: NSTextField!
    
    @IBOutlet weak var txtDetalle: NSTextField!
    
    @IBOutlet weak var cmbImagenes: NSPopUpButton!
    
    @IBAction func onAceptar(_ sender: Any) {
        
        let datos = Datos()
        
        datos.Descripcion =  txtDescripcion.stringValue
        datos.Titulo = txtTitulo.stringValue
        datos.Imagen = cmbImagenes.titleOfSelectedItem!
        datos.Detalle = txtDetalle.stringValue
        
        if esModificacion == true {
            viewController.actualizar(losDatosTabla: datos, yTambien: row)
        }else {
            viewController.insertar(losDatosTabla: datos)
        }
        
    }
    
    @IBAction func onCancelar(_ sender: Any) {
        dismiss(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        if esModificacion ==  true {
            txtTitulo.stringValue =  datos.Titulo
            txtDescripcion.stringValue = datos.Descripcion
            txtDetalle.stringValue = datos.Detalle
            cmbImagenes.setTitle(datos.Imagen)
        }
  
    }
    
}
