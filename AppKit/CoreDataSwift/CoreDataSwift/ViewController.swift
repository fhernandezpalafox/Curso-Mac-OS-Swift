//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by Felipe Hernandez on 26/04/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

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

        // Cargar Datos iniciales de la base de datos
        CargarDatos()
    }
    
    func Eliminar() {
        
        if Tabla.selectedRow != -1 { //verifico si esta seleccionado un elemento de la tabla
        
            //llamo la instancia de appDelegate  y de ManagedContext
            let appDelegate = NSApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //selecciona el posición de la tabla
            let selectedrow = Tabla.selectedRow
            
            let p = personas[selectedrow] //aqui extraigo el objeto persona de la lista
            
            managedContext.delete(p) //elimino el objeto extraido
            
            do
            {
                try managedContext.save() //guardo los cambios
                CargarDatos() //vuelvo a cargar los datos
                Tabla.reloadData()  //limpio la tabla
            }catch let error  as NSError{
                print("Error \(error)  \(error.userInfo)")
            }
        }
        
        limpiarFormulario()
    }
    
    func CargarDatos(){
        //se realiza las instancias del appdelegeta y del managedContext para consulta de la base de datos
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //se realizala consulta a la tabla persona mediante el NSFetchRequest
        let fetchRequest: NSFetchRequest<Persona> = Persona.fetchRequest()
        
        do
        {
          let resultados =  try managedContext.fetch(fetchRequest)
            personas = resultados as [NSManagedObject] 
        }catch let error as NSError{
            print("error \(error)  \(error.userInfo)")
        }
        
        Tabla.reloadData()
    }
    
    func Actualizar() {
        
        let p = personas[Tabla.selectedRow] as NSManagedObject
        
    
        p.setValue(txtNombre.stringValue, forKey: "nombre")
        p.setValue(cmbEdoCivil.stringValue, forKey: "estadoCivil")
        p.setValue(txtEdad.intValue, forKey: "edad")
        p.setValue(txtDomicilio.stringValue, forKey: "domicilio")
        
        do
        {
            try p.managedObjectContext?.save()
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
        
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Persona", in: managedContext)
        let persona =  NSManagedObject(entity: entity!, insertInto: managedContext)
        
        persona.setValue(nombre, forKey: "nombre")
        persona.setValue(estadoCivil, forKey: "estadoCivil")
        persona.setValue(edad, forKey: "edad")
        persona.setValue(domicilio, forKey: "domicilio")
        
        do
        {
            try managedContext.save()
            CargarDatos()
            Tabla.reloadData()
        }catch let error as NSError{
            print("error \(error)  \(error.userInfo)")
        }
        
        limpiarFormulario()
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

