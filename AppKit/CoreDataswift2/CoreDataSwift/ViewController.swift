//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by Felipe Hernandez on 26/04/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    var appDelegate: AppDelegate?
    var managedContext: NSManagedObjectContext?
    
    //Relaciones
    @IBOutlet weak var txtNombre: NSTextField!
    
    @IBOutlet weak var txtEdad: NSTextField!
    
    @IBOutlet weak var cmbEdoCivil: NSComboBox!
    
    @IBOutlet weak var txtDomicilio: NSTextField!
    
    
    @IBAction func onEliminar(_ sender: Any) {
        Eliminar()
    }
    
    
    @IBAction func onActualizar(_ sender: Any) {
        Actualizar()
    }
    
    @IBAction func onGuardar(_ sender: Any) {
        
        GuardarPersona(nombre: txtNombre.stringValue, estadoCivil: cmbEdoCivil.stringValue, edad: txtEdad.intValue, domicilio: txtDomicilio.stringValue)

    }
    
    @IBOutlet weak var Tabla: NSTableView!
    
    var objPersona : Persona?
    
    var personas  = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appDelegate = NSApplication.shared.delegate as? AppDelegate
        managedContext = appDelegate?.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
        CargarDatos()
    }
    
    func Eliminar() {
        
        if Tabla.selectedRow != -1 {
        
            let selectedrow = Tabla.selectedRow;
            
            let p = personas[selectedrow]
            
            managedContext?.delete(p)
            
            do
            {
                try managedContext?.save()
                CargarDatos()
                Tabla.reloadData()
            }catch let error  as NSError{
                print("Error \(error)  \(error.userInfo)")
            }
        }
        
        limpiarFormulario()
    }
    
    func CargarDatos(){
        let fetchRequest: NSFetchRequest<Persona> = Persona.fetchRequest()
        
        do
        {
            let resultados =  try managedContext?.fetch(fetchRequest)
            personas = resultados as! [NSManagedObject]
        }catch let error as NSError{
            print("error \(error)  \(error.userInfo)")
        }
        
        Tabla.reloadData()
    }
    
    func Actualizar() {
        
        let persona = personas[Tabla.selectedRow] as! Persona
        
        persona.nombre = txtNombre.stringValue
        persona.domicilio =  txtDomicilio.stringValue
        persona.edad = txtEdad.intValue
        persona.estadoCivil = cmbEdoCivil.stringValue
        
        do
        {
            try persona.managedObjectContext?.save()
            CargarDatos()
            Tabla.reloadData()
        }catch let error as NSError{
            print("error \(error)  \(error.userInfo)")
        }
        
        limpiarFormulario()
    }
    
    func limpiarFormulario() {
        txtDomicilio.stringValue =  ""
        txtEdad.stringValue = ""
        txtNombre.stringValue = ""
        cmbEdoCivil.stringValue = ""
    }
    
    func GuardarPersona(nombre:String, estadoCivil:String, edad: Int32, domicilio:String ){
        
        let persona = NSEntityDescription.insertNewObject(forEntityName: "Persona", into: managedContext!) as? Persona
        
        persona?.nombre = txtNombre.stringValue
        persona?.domicilio =  txtDomicilio.stringValue
        persona?.edad = txtEdad.intValue
        persona?.estadoCivil = cmbEdoCivil.stringValue
        
        do
        {
            try persona?.managedObjectContext?.save()
            CargarDatos()
            Tabla.reloadData()
        }catch let error as NSError{
            print("error \(error)  \(error.userInfo)")
        }
        
        limpiarFormulario()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    //NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return personas.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        
        let p: Persona? = personas[row] as? Persona
        
        let identifier:String = tableColumn!.identifier.rawValue
        let columna = p?.value(forKey: identifier)
        return columna

    }
    
    //NSTableViewDelegate
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        if Tabla.selectedRow != -1 {
            
            let tableview : NSTableView? = notification.object as? NSTableView
            let personaSelect = personas[tableview?.selectedRow ?? 0] as? Persona
            
            objPersona =  personaSelect
            
            txtNombre.stringValue = (personaSelect?.nombre)!
            txtDomicilio.stringValue =  (personaSelect?.domicilio)!
            txtEdad.stringValue =  String((personaSelect?.edad)!)
            cmbEdoCivil.stringValue = (personaSelect?.estadoCivil)!
        }
    }
}

