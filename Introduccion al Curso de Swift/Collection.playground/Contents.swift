//: Playground - noun: a place where people can play

import UIKit

// Arreglos

var arreglo:[String] = ["a","b"]

arreglo.insert("c", atIndex: 2)

arreglo.removeAtIndex(0)

arreglo.insert("d", atIndex: 0)


var valorIndiceCero = arreglo[1]


//Diccionarios

var diccionario: [String:String] =
     ["a":"Primer Letra del  abecedario",
      "b":"Segunda Letra del  abecedario",
      "c":"Tercer Letra del  abecedario"]


diccionario["d"] = "Tercera letra del abecedario"

var  valorLetraB =  diccionario["b"]
