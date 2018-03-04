//: Playground - noun: a place where people can play

import UIKit

// Arreglos

var arreglo:[String] = ["a","b","c"]

//Diccionarios

var diccionario: [String:String] =
    ["a":"Primer Letra del  abecedario",
     "b":"Segunda Letra del  abecedario",
     "c":"Tercer Letra del  abecedario"]

//Estructura de JSON
/*
 {
     key:Value
     Nombre:"Felipe Hernandez",
     Calificaciones:{
        Matematicas:"10",
        Español:"9"
       },
     Edad:29,
     Carrera:"Sistemas"
 }
 */

//For reducido
//for i = 0; i <= 2; i++{}

// for i in 0 .. 2 {}
for i in 0 ..< arreglo.count {
    
  print(arreglo[i])
    
}


//Ciclo For In
for itemArreglo  in arreglo{

 print(itemArreglo)
    
}

for itemDiccionario in diccionario{

   print(itemDiccionario)
}









