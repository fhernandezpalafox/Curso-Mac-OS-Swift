//: Playground - noun: a place where people can play

import UIKit

var cajaCerradaCebollas:Int?

   //cajaCerradaCebollas = 10
if cajaCerradaCebollas != nil {

  //Desenvolver(abrir) - Unwrap
    
    let cantidadCebollas = cajaCerradaCebollas!
    
    print("Tengo \(cantidadCebollas) cebollas")
} else {
   
    print("No hay cebollas dentro de la caja")
}


//Optional Binding 

if let cantidadCebollas = cajaCerradaCebollas {

    print("Tengo \(cantidadCebollas) cebollas")

}else {

    print("No hay cebollas dentro de la caja")
}






