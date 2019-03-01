//: Playground - noun: a place where people can play

import UIKit

print("Hola mundo")


//Estructura de una funcion 
func  ejemplo(param: String) {

    print("Hola mundo \(param) desde una funcion")

}

ejemplo(param: "Felipe")


//funcion que manda parametros
func Operacion(param: Int){
  
    var x = param
    
    x = x + 10
}

Operacion(param: 10)


//funcion que retorna un dato
func OperacionConReturn(param:Int)->Int {
    
    var x = param
    
    x = x * 2
    
    return x
}

var resultado = OperacionConReturn(param: 10)


//funcion que manda mas de un parametro
func enteroPorDos(_ parametro1:Int,_ parametro2:Int) -> Int{

    return parametro1 * parametro2
}


var resultado2 = enteroPorDos(10,10)



