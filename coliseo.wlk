import gladiadores.*
import armasYArmaduras.*

class GrupoDeGladiadores {
    const nombre  
    const gladiadores = []
    var cantPeleasParticipadas = 0

    method agregarGladiador(unGladiador) {
        gladiadores.add(unGladiador)
    }
    method sacarGladiador(unGladiador) {
        gladiadores.remove(unGladiador)
    }
    method elegirCampeon() = self.gladiadoresDisponibles().max({g => g.poderAtaque()})
    method gladiadoresDisponibles() = gladiadores.filter({g => g.vidaActual() > 0})

    method decirNombre() = nombre
    method sumarPelea() {
        cantPeleasParticipadas += 1
    }
    method cantPeleasParticipadas() = cantPeleasParticipadas 

}

object coliseo {
    const grupos = [] 

    method añadirGrupo(unGrupo) {
        grupos.add(unGrupo)
    }
    method sacarGrupo(unGrupo) {
        grupos.remove(unGrupo)
    }
    method peleaInjusta(grupo, gladiador) {
        if(gladiador.vidaActual() <= 0) {
            console.println("Ganó " + grupo.decirNombre())
        } else if(grupo.gladiadoresDisponibles().isEmpty()){
            console.println("Ganó " + gladiador.decirNombre())
        } else {
            const peleadorDeGrupo = grupo.elegirCampeon()
            gladiador.atacar(peleadorDeGrupo)
            self.peleaInjusta(grupo, gladiador)
        }
    }
    method round1(grupoA, grupoB) {
        const peleador1 = grupoA.elegirCampeon()
        const peleador2 = grupoB.elegirCampeon()
        peleador1.atacar(peleador2)
        grupoA.sumarPelea()
        grupoB.sumarPelea()
    }
    method round2(grupoA, grupoB) {
        const peleador1 = grupoA.elegirCampeon()
        const peleador2 = grupoB.elegirCampeon()
        peleador1.atacar(peleador2)
        grupoA.sumarPelea()
        grupoB.sumarPelea()
    }
    method round3(grupoA, grupoB) {
        const peleador1 = grupoA.elegirCampeon()
        const peleador2 = grupoB.elegirCampeon()
        peleador1.atacar(peleador2)
        grupoA.sumarPelea()
        grupoB.sumarPelea()
    }
}