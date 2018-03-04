//
//  ViewController.swift
//  AppEjercicio2
//
//  Created by Felipe Hernandez on 14/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func Alerta1(_ sender: Any) {
        
        let alert = NSAlert()
        alert.addButton(withTitle: "Continuar")
        alert.addButton(withTitle: "Cancelar")
        alert.messageText = "Alerta sencilla"
        alert.informativeText = "Desea eliminar el registro seleccionado"
        alert.alertStyle = .warning //NSAlert.Style.warning  //.warning
        
        let res: NSApplication.ModalResponse = alert.runModal()
        
        //NSApplication.ModalResponse.alertFirstButtonReturn
        if res == .alertFirstButtonReturn {
            print("Continuar")
        }
        else if res == .alertSecondButtonReturn {
            print("Cancelar")
        }
    }

    
    @IBAction func Alerta2(_ sender: Any) {
        
        let alert = NSAlert()
        alert.addButton(withTitle: "Continuar")
        alert.addButton(withTitle: "Cancelar")
        alert.messageText = "Alerta sencilla"
        alert.informativeText = "Desea eliminar el registro seleccionado"
        alert.alertStyle = .warning
        alert.beginSheetModal(for: view.window!, completionHandler: {(_ returnCode: NSApplication.ModalResponse) -> Void in
            if returnCode == .alertFirstButtonReturn {
                print("Boton continuar clickeado")
            }
            else if returnCode == .alertSecondButtonReturn {
                print("Boton de cancelar clickeado")
            }
        })
        
    }
    
    @IBAction func Alerta3(_ sender: Any) {
        
        let alert = NSAlert()
        alert.addButton(withTitle: "Continuar")
        alert.messageText = "Alerta sencilla"
        alert.informativeText = "Se ha realizado la operación correctamente"
        alert.alertStyle = .informational
        alert.runModal()
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

