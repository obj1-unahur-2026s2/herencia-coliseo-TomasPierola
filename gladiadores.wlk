import coliseo.*
import armasYArmaduras.*

class Gladiador {
    const nombre  
    var vida = 100
    method atacar(gladiador) {}
}

class Mirmillon inherits Gladiador {
    const fuerza 
    var arma
    var armadura

    method destreza() = 15 
    method fuerza() = fuerza 
    method defensa() = armadura.armaduraTotal(self) + self.destreza()
    method poderAtaque() = fuerza + arma.valorAtaque()
    method vidaActual() = vida
    method restaurarVida() {
        vida = 100
    }
    method decirNombre() = nombre 

    
    method cambiarArmadura(nuevaArmadura) {
      armadura = nuevaArmadura
    }
    method cambiarArma(nuevaArma) {
      arma = nuevaArma
    }
    override method atacar(gladiador) {
        gladiador.recibirDaño((self.poderAtaque() - gladiador.defensa()).max(0), self)
    }
    method recibirDaño(cantidad, gladiador) {
        vida = (vida - cantidad).max(0) 
        self.contraatacar(gladiador)
    }
    method contraatacar(gladiador) {
        if(self.vidaActual() > 0) self.atacar(gladiador) else console.println(self.decirNombre() + "fue derrotado, el ganador es " + gladiador.decirNombre())
    }
    
    method crearGrupo(unGladiador) {
        const grupo = new GrupoDeGladiadores(nombre="Mirmillolandia")
        grupo.agregarGladiador(self)
        grupo.agregarGladiador(unGladiador)
        return grupo
    }
}

class Dimachaerus inherits Gladiador {
    var destreza 
    const armas = []

    method vidaActual() = vida 
    method destreza() = destreza
    method fuerza() = 10
    method defensa() = self.destreza() / 2
    method poderAtaque() = self.fuerza() + armas.sum({a => a.valorAtaque()})
    method restaurarVida() {
        vida = 100
    }
    method decirNombre() = nombre 

    method añadirArma(arma) {
        armas.add(arma)
    }
    method sacarArma(arma) {
        armas.remove(arma)
    }
    override method atacar(gladiador) {
        gladiador.recibirDaño((self.poderAtaque() - gladiador.defensa()).max(0), self)
        destreza += 1
    }
    method recibirDaño(cantidad, gladiador) {
        vida = (vida - cantidad).max(0) 
        self.contraatacar(gladiador)
    }
    method contraatacar(gladiador) {
        if(self.vidaActual() > 0) self.atacar(gladiador) else console.println(self.decirNombre() + "fue derrotado, el ganador es " + gladiador.decirNombre())
    }

    method cambiarArmadura() {}
    method cambiarArma() {}
    method crearGrupo(unGladiador) {
        const grupo = new GrupoDeGladiadores(nombre = "D-"+ (self.poderAtaque() + unGladiador.poderAtaque()))
        grupo.agregarGladiador(self)
        grupo.agregarGladiador(unGladiador)
        return grupo
    }
}