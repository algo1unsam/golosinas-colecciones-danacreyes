object bombon {
    var property precio = 5
    var property peso = 15
    var property sabor = frutilla
    var property gluten = false
    var property mordisco = 0 

    method mordisco() {
        mordisco = peso * 0.8 - 1
        return mordisco
    }
}
object alfajor {
    var property precio = 12
    var property peso = 300
    var property sabor = chocolate
    var property gluten = true
    var property mordisco = 0 

    method mordisco() {
        mordisco = peso * 0.8
        return mordisco
    }
}
object caramelo {
    var property precio = 1
    var property peso = 5
    var property sabor = frutilla
    var property gluten = false
    var property mordisco = 0 

    method mordisco() {
        mordisco = peso - 1 
        return mordisco
    }
}
object chupetin {
    var property precio = 2
    var property peso = 7
    var property sabor = naranja
    var property gluten = false
    var property mordisco = 0 

    method mordisco() {
        if (peso > 2){mordisco = peso * 0.9 }
        return mordisco
    }
}
object oblea {
    var property precio = 5
    var property peso = 250
    var property sabor = vainilla
    var property gluten = true
    var property mordisco = 0 

    method mordisco() {
        if (peso > 70){mordisco = peso * 0.5 }
        else {mordisco = peso * 0.25 }
        return mordisco
    }
}
object chocolatin {
    var property pesoInicial = 0
    var property pesoActual = 0
    var property precioInicial = 0
    var property sabor = chocolate
    var property gluten = true
    var property mordisco = 0 

    method peso(_peso) {
        pesoInicial = _peso 
        pesoActual = _peso
        precioInicial = 0.5 * pesoInicial // El precio se calcula según el peso inicial
    }
    method mordisco() {
        pesoActual = pesoActual - 2
        return pesoActual
    }
    method precioActual() {
        return precioInicial
    }
}
object golosinaBaniada {
    var property golosinaBase = null
    var property banioChocolate = 4
    var property mordisco = 0 

    method golosinaBase(golosina) {
      golosinaBase = golosina
    }

    method precio() = golosinaBase.precio() + 2
    method peso() = golosinaBase.peso() + banioChocolate
    method sabor() = golosinaBase.sabor()
    method gluten() = golosinaBase.gluten()
    method mordisco() {
        golosinaBase.mordisco()
        if (banioChocolate > 0) {banioChocolate = banioChocolate - 2}
        return banioChocolate
    }
}
object tutti{
    var property precioInicial = 0
    var property precioActual = 0
    var property peso = 5
    var property sabor = naranja   
    var property gluten = false

    method gluten(_gluten) {
      gluten = _gluten
      return gluten
    }
    method precio() {
      if (gluten){precioInicial = 7}
      else {precioInicial = 10}
      precioActual = precioInicial
      return precioActual
    }

    method mordisco(){
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

object mariano{
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
