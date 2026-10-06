class Filo {
    const filo
    const longitud

    method valorAtaque() = filo * longitud
}

class Contundente {
    const peso

    method valorAtaque() = peso
}

class Casco {
    method armaduraTotal(luchador) = 10 
}

class Escudo {
    method armaduraTotal(luchador) = 5 + (luchador.destreza() * 0.1) 
}
