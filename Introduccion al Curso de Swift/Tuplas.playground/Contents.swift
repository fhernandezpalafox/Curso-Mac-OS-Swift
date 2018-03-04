//: Playground - noun: a place where people can play

import UIKit

// 9,10,6,3,7
func minMax(array: [Int]) -> (min: Int, max: Int){
    
    var valorMin = array[0]
    var valorMax = array[0]
    
    for valor in array[1..<array.count]{
        
        if valor < valorMin {
            
            valorMin = valor
            
        }else if valor > valorMax {
            
            valorMax = valor
        }
    }
    return (valorMin,valorMax)
}

let datos = minMax(array: [9,10,6,3,7])

print("valor minimo \(datos.min) y valor max \(datos.max)")
