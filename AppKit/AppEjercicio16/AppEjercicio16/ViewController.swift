//
//  ViewController.swift
//  AppEjercicio16
//
//  Created by Felipe Hernandez on 22/03/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView:NSTableView!
    
   var lista = [Datos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self 
        
        let d = Datos()
        d.Titulo = "Felipe"
        d.Descripcion = "Esto es una descripcion"
        d.Detalle = "Esto es un detalle"
        d.Imagen = "NSUser"
        
        lista.append(d)
        tableView.reloadData()
    }

    func actualizar(losDatosTabla datos : Datos,  yTambien Fila: Int) {
        lista.remove(at: Fila)
        lista.append(datos)
        tableView.reloadData()
    }
    
    func insertar(losDatosTabla datos : Datos) {
        lista.append(datos)
        tableView.reloadData()
    }

    func eliminarDatoSeleccionado(Fila : Int) {
        lista.remove(at: Fila)
        tableView.reloadData()
    }
    
    
    //La funcion de este metodo es para permitir o no visualizar la siguiente viewController
    override func shouldPerformSegue(withIdentifier identifier: NSStoryboardSegue.Identifier, sender: Any?) -> Bool {
        
        if identifier  == "editar" {
            let row = self.tableView.selectedRow
            
            if  row == -1  {
                print("Selecciona un registro, por favor")
                return false
            }else {
                return true
            }
        } else if identifier  == "agregar" {
            return  true
        }
        return false
    }
    
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "agregar"{
           let vc = segue.destinationController as! AgregarAlumnoViewController
               vc.viewController =  self
           
        }else if segue.identifier == "editar"{
            var row:Int = 0
            
            var  d = Datos()
            
            do{
                row = self.tableView.selectedRow
                
                if  row == -1  {
                    print("Selecciona un registro, por favor")
                }else {
                   d = lista[row]
                }
  
            }catch{
                print("Error")
            }
            
            let vc = segue.destinationController as! AgregarAlumnoViewController
            vc.viewController =  self //this
            vc.esModificacion =  true
            vc.datos = d
            vc.row  =  row
        }
        
    }

}


extension ViewController:NSTableViewDataSource, NSTableViewDelegate{
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        
        let result:CustomCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! CustomCell
        
        result.viewController =  self
        result.Fila =  row
        
        let d: Datos? = lista[row]
        
        result.Imagen.image = (NSImage(named: d!.Imagen))!
        
        result.Descripcion.stringValue = (d?.Descripcion)!
        
        result.Detalle.stringValue = (d?.Detalle)!
        
        result.Titulo.stringValue = (d?.Titulo)!

        result.Descripcion.sizeToFit()
        result.Detalle.sizeToFit()
        result.Titulo.sizeToFit()
        
        return result
        
    }
    
}

