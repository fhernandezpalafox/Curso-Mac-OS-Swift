//: Playground - noun: a place where people can play

import Cocoa

class Artista{
    var Nombre:String
    var Nacimiento:Int
    var Descripcion:String
    
    init(No:String, Na:Int, Des:String){
        self.Nombre = No
        self.Nacimiento = Na
        self.Descripcion = Des
    }
    func imprimir(){
    }
    func test(){
        print(self.Nombre)
    }
    func obtenerEdad () -> Int{
        let ahora:Int = 2017
        
        return ahora - self.Nacimiento
        
    }
}

class Cancion{
    var Titulo:String
    var Ano:Int
    var Duracion:Float
    var Album:String
    var Autor:Artista
    
    
    init(Ti:String, An:Int, Du:Float, Al:String, Au:Artista){
        self.Titulo=Ti
        self.Ano=An
        self.Duracion=Du
        self.Album=Al
        self.Autor=Au
        
    }
    
    func imprimir(){
        print(self.Titulo)
        print(self.Autor.Nombre)
    }
    
    func comparar(cancion1:Cancion)->Bool{
        var igual:Bool
        
        
        if self.Titulo == cancion1.Titulo && self.Autor.Nombre == cancion1.Autor.Nombre {
            igual=true
        }
        else{
            igual=false
        }
        return igual
    }
    func copiar()->Cancion{
        let copia:Cancion = Cancion(Ti:self.Titulo,An:self.Ano,Du:self.Duracion,Al:self.Album,Au:self.Autor)
        return copia
    }
    
}
print ("Compilación OK")

var pol:Artista = Artista(No:"POL",Na:1994,Des:"Artista del Maresme")

var nata:Artista = Artista(No:"Natalia",Na:1990,Des:"Artista del Valles")

var tema1:Cancion = Cancion(Ti:"CaraPan",An:2016,Du:3,Al:"Caras",Au:pol)

var tema2:Cancion = Cancion(Ti:"CaraPan",An:2016,Du:3,Al:"FastFood",Au:nata)

print(pol.obtenerEdad())
print("--------------------")
tema1.imprimir()
print("--------------------")
print(tema1.comparar(cancion1:tema1))
print(tema1.comparar(cancion1:tema2))
print("--------------------")
var tema3:Cancion = tema2.copiar()
tema3.imprimir()












