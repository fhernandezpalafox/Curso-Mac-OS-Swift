//
//  CustomCell.swift
//  AppEjercicio16
//
//  Created by Felipe Hernandez on 22/03/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class CustomCell: NSTableCellView {

    var viewController = ViewController()
    var Fila : Int = 0
    
    @IBOutlet weak var Imagen: NSImageView!
    @IBOutlet weak var Titulo: NSTextField!
    @IBOutlet weak var Descripcion: NSTextField!
    @IBOutlet weak var Detalle : NSTextField!
    
    @IBAction func onDetalle(_ sender: Any) {
        //NSLog("Tu titulo \(Titulo.stringValue)")
        viewController.eliminarDatoSeleccionado(Fila: Fila)
    }
    
   /* override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }*/
    
}
