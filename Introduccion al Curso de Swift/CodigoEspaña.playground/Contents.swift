//: Playground - noun: a place where people can play

import Cocoa

class Artista {
    
    var Nombre:String = ""
    var Nacimiento = 02/06/1987
    var Descripcion:String = ""
    
    init () {
        Nombre = "Jose"
        Descripcion = "Artista post-moderno"
    }
    
    func Imprimir() {
        print("Tu nombre es \(Nombre) y eres un \(Descripcion)")
    }
    func obtenerEdad(num1:Int,num2:Int) -> Int{
        return num1 - num2
    }
}

let artista = Artista()

var resultado = artista.obtenerEdad(num1:2017,num2:1987)

artista.Imprimir()

print("Tiene \(resultado) años de edad")


class Cancion {
    var Titulo:String
    var Año:Int
    var Duracion:Float
    var Album:String
    let Autor = Artista()
    
    init() {
        Titulo = "Volare"
        Año = 2015
        Duracion = 3.15
        Album = "Sunshine"
    }
    
    func Imprimir() -> String {
        return "\(Autor.Nombre) con la cancion: \(Titulo)"
    }
    
    func Compara(cancion:Cancion, cancionnew:Cancion) -> Bool {
        cancionnew.Titulo = "Bambolero"
        cancionnew.Año = 2002
        cancionnew.Duracion = 3.00
        cancionnew.Album = "Torero"
        
       
        
        if cancionnew.Titulo == cancion.Titulo && cancionnew.Album == cancion.Album{
            return true
        } else {
            return false
        }
    }
    
    func Copia() -> Any{
        let copy = self
        return copy
    }
}



