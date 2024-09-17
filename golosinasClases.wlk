class Golosina {
    var property peso
    var property precio
    var property sabor  

    method gluten() = false
    method mordisco(){}

    method peso() = peso
    method precio() = precio
    method sabor() = sabor
}

// para cambiar algo de la clase : override, pisa lo que estaba escrito
// object bombon inherits Golosina...
// 
object bombon inherits Golosina(peso = 15, precio = 5, sabor = frutilla){
    var property mordisco = 0 
    override method gluten() = false

    override method mordisco() {
        mordisco = peso * 0.8 - 1
        return mordisco
    }
}
object alfajor inherits Golosina(peso = 300, precio = 12, sabor = chocolate){
    override method gluten()= true
    var property mordisco = 0 

    override method mordisco() {
        mordisco = peso * 0.8
        return mordisco
    }
}
object caramelo inherits Golosina(peso = 5, precio = 1, sabor = frutilla){
    override method gluten() = false
    var property mordisco = 0 

    override method mordisco() {
        mordisco = peso - 1 
        return mordisco
    }
}
object chupetin inherits Golosina(peso = 7, precio = 2, sabor = naranja){
    override method gluten() = false
    var property mordisco = 0 

    override method mordisco() {
        if (peso > 2){mordisco = peso * 0.9 }
        return mordisco
    }
}
object oblea inherits Golosina(peso = 250, precio = 5, sabor = vainilla){
    override method gluten()= true
    var property mordisco = 0 

    override method mordisco() {
        if (peso > 70){mordisco = peso * 0.5 }
        else {mordisco = peso * 0.25 }
        return mordisco
    }
}
object chocolatin inherits Golosina(peso = 0, precio = 0, sabor = chocolate) {
    var property pesoInicial = peso
    var property pesoActual = 0
    var property precioInicial = precio
    override method gluten() = true
    var property mordisco = 0 

    override method peso(_peso) {
        pesoInicial = _peso 
        pesoActual = _peso
        precioInicial = 0.5 * pesoInicial // El precio se calcula según el peso inicial
    }
    override method mordisco() {
        pesoActual = pesoActual - 2
        return pesoActual
    }
    method precioActual() {
        return precioInicial
    }
}
class GolosinaBaniada inherits Golosina{
    var property golosinaBase = null
    var property banioChocolate = 4
    var property mordisco = 0 

    method golosinaBase(golosina) {
      golosinaBase = golosina
    }

    override method precio() = golosinaBase.precio() + 2
    override method peso() = golosinaBase.peso() + banioChocolate
    override method sabor() = golosinaBase.sabor()
    override method gluten() = golosinaBase.gluten()
    override method mordisco() {
        golosinaBase.mordisco()
        if (banioChocolate > 0) {banioChocolate = banioChocolate - 2}
        return banioChocolate
    }
    method baniar(unaGolsina) = unaGolsina.peso() + banioChocolate
    method esBaniada() = true
}
object tutti inherits Golosina(peso = 5, precio = 0, sabor = naranja){
    var property precioInicial = precio
    var property precioActual = 0
    var property gluten = false

    //var property peso = 5
    //override method gluten() = false

    method gluten(_gluten) {
        gluten = _gluten
        return gluten
    }
    override method precio() {
        if (gluten){precioInicial = 7}
        else {precioInicial = 10}
        precioActual = precioInicial
        return precioActual
    }

    override method mordisco(){
        sabor = sabor.siguiente()
    }
}
object frutilla {
    method siguiente() = chocolate
}
object chocolate {
    method siguiente() = naranja
}
object naranja {
    method siguiente() = frutilla
}
object vainilla {
}

// .+* PARTE 2 *+.
// cosas que voy a necesitar
// map = transforma, devuelvo alto totalmente nuevo
// === es más estricto que ==
// .asSet(): no repite / .asList() 

class Mariano{
    var property bolsa = []

    method comprar(golosina) = bolsa.add(golosina)

    method desechar(golosina) = bolsa.remove(golosina)

    method probarGolosina() = bolsa.forEach{golosina => golosina.mordisco()}

    method hayGolosinaSinTACC() = bolsa.any{golosina => golosina.gluten()}

    method preciosCuidados() = bolsa.all{golosina => golosina.precio() <= 10}
    
    method golosinaDeSabor(unSabor) = bolsa.find{golosina => golosina.sabor() == unSabor}
    
    method golosinasDeSabor(unSabor) = bolsa.filter{golosina => golosina.sabor() == unSabor}

    method sabores() = bolsa.map{golosina => golosina.sabor()}.asSet()

    method golosinaMasCara() = bolsa.max{golsina => golsina.precio()}

    method pesoGolosina() = bolsa.sum {golsina => golsina.peso()}

    method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.find{golosina => !bolsa.contains(golosina)}
    
    method gustosFaltantes(gustosDeseados) = gustosDeseados.filter{ gusto => !bolsa.contains { golosina => golosina.sabor() == gusto } }

}
