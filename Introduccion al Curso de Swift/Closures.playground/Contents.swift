//: Playground - noun: a place where people can play

import UIKit

func mayorQue(a:Int, b:Int) -> Bool {
    return a > b
}


mayorQue(a: 3, b: 4)


//Closures are self-contained blocks of funcionality that can be passed around and used in your code

var closure = {
  (a:Int, b:Int) -> Bool in  return  a > b
}


closure(3, 4)




//Beneficios 
var arreglo =  [1,3,5,2,7,9]

arreglo.sort()

arreglo.sorted(by: closure)



