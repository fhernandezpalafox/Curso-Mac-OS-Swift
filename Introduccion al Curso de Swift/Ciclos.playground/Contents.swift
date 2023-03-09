//: Playground - noun: a place where people can play

import UIKit

var str = "El tema  que se va ver es Ciclos"

//Uso de print
print("Hola mundo")

//Ciclos

print("Jose")
print("Pedro")

var nombres = ["Jose","Pedro","Pablo","Sergio",
               "Andres","Manuel"]

print(nombres[0])
print(nombres[1])


// a) FOR swift 3
/*
var i = 0

for  i = 0; i < nombres.count; i += 1 {
    print(nombres[i])
}
*/

if !nombres.isEmpty {
    for item in nombres {
       print(item)
    }
}

// b) REPEAT =  do while

//Este entra por lo menos una vez
var j = 1

repeat  {
    
    print("Hola mundo")
    j += 1

}while( j < 10)




// c) WHILE

var k = 9

while k < 10{
    
    print("Hola mundo")
    k += 1

}












