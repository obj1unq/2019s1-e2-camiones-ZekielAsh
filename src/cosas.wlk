object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }
	method estaSiendoCargada() { /* No hace nada */}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() { return 2 }
	method estaSiendoCargada() {transformadoEnAuto = false}
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 1
	
	method peso() { return cantidadDeLadrillos * 2 }
	method nivelPeligrosidad() { return 2 }
	method bultos() { return if (cantidadDeLadrillos > 300) { 3 } 
		else if (cantidadDeLadrillos > 100) { 2 } else { 1 }
	}
	method estaSiendoCargada() { cantidadDeLadrillos += 12}
}

object arenaGranel {
	var property peso = 10
	
	method nivelPeligrosidad() { return 1 }
	method bultos() { return 1 }
	method estaSiendoCargada() { peso += 20}
}

object bateriaAntiaerea {
	var cargadaConMisiles = false
	
	method peso(){ return if (cargadaConMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (cargadaConMisiles) { 100 } else { 0 } }
	method cargarMisiles() { cargadaConMisiles = true }
	method bultos() { return if (cargadaConMisiles) { 2 } else { 1 }
	}
	method estaSiendoCargada() { self.cargarMisiles() }
}

object contenedorPortuario {
	const cosas = []
	
	method peso() { return 100 + cosas.sum({cosa => cosa.peso()})}
	method nivelPeligrosidad() { return if (cosas.isEmpty()) { 0 }
			else { self.cosaMasPeligrosa() }
	}
	method cosaMasPeligrosa(){
		 return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}
	method cargar(cosa){
		cosas.add(cosa)
	}
	method descargar(cosa){
		cosas.remove(cosa)
	}
	method bultos() { return 1 + cosas.sum({cosa => cosa.bulto()}) }
	method estaSiendoCargada() { cosas.forEach({cosa => cosa.estaSiendoCargada()}) }
}

object residuosRadioactivos{
	var property peso = 50
	
	method nivelPeligrosidad() { return 200 }
	method bultos() { return 1 }
	method estaSiendoCargada() { peso += 15}
}

object embalajeDeSeguridad{
	var property cosaEmbalada = null
	
	method embalar(cosa) { cosaEmbalada = cosa }
	method peso() { cosaEmbalada.peso() }
	method nivelPeligrosidad() { return cosaEmbalada.nivelPeligrosidad() / 2 }
	method bultos() { return 2}
	method estaSiendoCargada() { /* No hace nada */}
}