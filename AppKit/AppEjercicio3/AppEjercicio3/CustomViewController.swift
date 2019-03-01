//
//  CustomViewController.swift
//  AppEjercicio3
//
//  Created by Felipe Hernandez on 21/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class CustomViewController: NSViewController {

    @IBOutlet weak var imagen: NSImageView!
    @IBOutlet weak var titulo: NSTextField!
    @IBOutlet weak var descripcion: NSTextField!
    //var dialog: CustomViewController?
    
    
    @IBAction func eventCancelar(_ sender: Any) {
        dismiss(self)
    }
    
    @IBAction func eventAceptar(_ sender: Any) {
        dismiss(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Asignacion de los datos desde la creacion del NSViewController
        titulo.stringValue  = "Este es mi titulo"
        
        descripcion.stringValue  = "Esta es una descripcion larga"
       
        //Propiedades de los labels
        titulo.font = NSFont(name: "Herculam", size: 15)
        titulo.textColor = NSColor.white
        titulo.backgroundColor = NSColor.blue
        titulo.drawsBackground = true
        titulo.isSelectable = true
       
        
        //Cargar la Imagen
        let img = NSImage(named: NSImage.Name("iconInformation.png"))
        
        //Mostrar la imagen
        imagen.image = img
        
        //instancia de la clase
        //dialog = CustomViewController()
        
        //asignar el nombre de la ventana
        title = "Dialog"
        
        //Adaptar el contenido al label
        titulo.sizeToFit()
        
        descripcion.sizeToFit()
    }
    
    
    
    
    
    
    
}
