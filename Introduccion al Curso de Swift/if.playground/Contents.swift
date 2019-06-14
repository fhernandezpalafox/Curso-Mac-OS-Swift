//: Playground - noun: a place where people can play

import UIKit

//if 

var miPeso  = 75

var miEstatura = 1.85

var perros = 2


//< , <= , >, >= , == ,!=

// && ||

if  miPeso >= 85 || miEstatura == 1.85 {
    
    
    if perros == 2 {
        
      print("Tengo  dos perros ")
        
    }
    
    print("Estoy en mi peso ideal")
    
    
    var papitas  = 0
    
    repeat  {
    
     papitas += 1
     
       print("Me comi \(papitas) papitas")
    
    }while( papitas < 10)
    
}else {

    print("No estoy en mi peso ideal")
}



//SWITCH

let comida = "carne"

let comidaCompleta = "Teriyaki de pollo"



switch  comida { //comidaCompleta

    case "arroz":
        print("Que rico Arroz!")
    break
    case "pollo","carne","ensalada":
        print("Cualquiera esta bien")
    break
    //let x = comida
    case let x where x.hasSuffix("pollo"): //tiene el sufijo
        print("Se me antoja \(x)")
    break
    default:
        print("No encontre nada")
    
}
