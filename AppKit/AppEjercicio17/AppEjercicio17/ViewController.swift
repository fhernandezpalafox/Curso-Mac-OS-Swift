//
//  ViewController.swift
//  AppEjercicio17
//
//  Created by Felipe Hernandez on 20/04/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var imageLocal: NSImage?
    
    @IBOutlet weak var img: NSImageView!
    
    @IBAction func onSeleccionar(_ sender: Any) {
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Selecciona un archivo tipo .ico";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["ico","jpg"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                
                //let imageData = NSData(contentsOf: result!)
                imageLocal =  NSImage(contentsOfFile: path)
                img.image = imageLocal!
            }
        } else {
            // User clicked on "Cancel"
            return
        }
        
        
        
    }
    
    @IBAction func onLimpiar(_ sender: Any) {
        
        txtCorreo.stringValue  = ""
        txtNombre.stringValue = ""
        txtApellido.stringValue = ""
        
        
    }
    
    var account1: Cuenta?
    
    @IBAction func onGuardar(_ sender: Any) {
        
        let employee = Empleado (nombre: txtNombre.stringValue,
                                 apellido: txtApellido.stringValue,
                                 icono: imageLocal,
                                 correo: txtCorreo.stringValue)
        
        account1?.empleados.append(employee)
        ListaMenu.reloadData()
        
        
    }
    
    
    @IBOutlet weak var ListaMenu: NSOutlineView!
    
    @IBOutlet weak var txtNombre: NSTextField!
    
    @IBOutlet weak var txtApellido: NSTextField!
    
    @IBOutlet weak var txtCorreo: NSTextField!
    
    //Inicializacion de datos de los diferentes modelos
    var department1 = Departamento (nombre:"Depto. Ingenieria",
                                    icono:NSImage (named: "Department-50"))
    
    var department2 = Departamento (nombre:"Depto. Licenciatura",
                                    icono:NSImage (named: "Department-50"))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         account1 = Cuenta(nombre:"Account 1",icono:NSImage (named: "account"))
        
        let employee10 = Empleado (nombre: "Debasis", apellido: "Das", icono: NSImage (named: "employee"), correo: "debasis_das@knowstack.com")
        
        let employee11 = Empleado (nombre: "Mary", apellido: "Jane", icono: NSImage (named: "employee"), correo: "maryjane@knowstack.com")
        
        account1!.empleados.append(employee10)
        account1!.empleados.append(employee11)
        
        
        let account2 = Cuenta(nombre:"Account 2",icono:NSImage (named: "account"))
        
        let employee20 = Empleado (nombre: "John", apellido: "Doe", icono: NSImage (named: "employee"), correo: "johndoe@knowstack.com")
        
        let employee21 = Empleado (nombre: "Jane", apellido: "Doe", icono: NSImage (named: "employee"), correo: "janedoe@knowstack.com")
        
        account2.empleados.append(employee20)
        account2.empleados.append(employee21)
        
        department1.cuentas.append(account1!)
        department1.cuentas.append(account2)
        
         self.ListaMenu?.expandItem(nil, expandChildren: true)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

//Delegate
extension ViewController: NSOutlineViewDelegate{
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        switch item {
        case let departamento as Departamento:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = departamento.nombre
            }
            return view
        case let cuenta as Cuenta:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = cuenta.nombre
            }
            if let image = cuenta.icono {
                view.imageView!.image = image
            }
            return view
        case let empleado as Empleado:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = empleado.nombre + " " + empleado.apellido
            }
            if let image = empleado.icono {
                view.imageView!.image = image
            }
            return view
        default:
            return nil
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
       
        switch item {
        case let departamento as Departamento:
            return true
        default:
            return false
        }
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        
        guard let outlineView = notification.object as? NSOutlineView else {
            return
        }
        
        let selectedIndex = outlineView.selectedRow
        
        if let objectEmpleado = outlineView.item(atRow: selectedIndex) as? Empleado {
        
            print("selected Object is a Employee " +  objectEmpleado.nombre)
            self.txtNombre?.stringValue = objectEmpleado.nombre
            self.txtApellido?.stringValue = objectEmpleado.apellido
            self.txtCorreo?.stringValue = objectEmpleado.correo
        }
        else{
            print("Do nothing on Department or Account Selection")
        }
    }
}

//DataSource
extension ViewController: NSOutlineViewDataSource {
    

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let _item = item as Any? {
            switch _item {
            case let departamento as Departamento:
                return departamento.cuentas.count
            case let cuenta as Cuenta:
                return cuenta.empleados.count
            default:
                return 0
            }
        } else {
            return 2 //Department1 , Department 2
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        
        switch item {
        case let departamento as Departamento:
            return (departamento.cuentas.count > 0) ? true : false
        case let cuenta as Cuenta:
            return (cuenta.empleados.count > 0) ? true : false
        default:
            return false
        }
        
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let _item = item as Any? {
            switch _item {
            case let department as Departamento:
                return department.cuentas[index]
            case let account as Cuenta:
                return account.empleados[index]
            default:
                return self
            }
        } else {
            switch index {
            case 0:
                return department1
            default:
                return department2
            }
        }
    }
    
}

