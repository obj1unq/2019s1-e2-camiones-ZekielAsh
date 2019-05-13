object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }
	method cambiar() { /* No hace nada */}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() { return 2 }
	method cambiar() {self.transformar()}
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 1
	
	method peso() { return cantidadDeLadrillos * 2 }
	method nivelPeligrosidad() { return 2 }
	method bultos() { return if (cantidadDeLadrillos > 300) { 3 } 
		else if (cantidadDeLadrillos > 100) { 2 } else { 1 }
	}
	method cambiar() { cantidadDeLadrillos += 12}
}

object arenaGranel {
	var property peso = 10
	
	method nivelPeligrosidad() { return 1 }
	method bultos() { return 1 }
	method cambiar() { peso += 20}
}

object bateriaAntiaerea {
	var cargadaConMisiles = false
	
	method peso(){ return if (cargadaConMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (cargadaConMisiles) { 100 } else { 0 } }
	method cargarMisiles() { cargadaConMisiles = true }
	method bultos() { return if (cargadaConMisiles) { 2 } else { 1 }
	}
	method cambiar() { self.cargarMisiles() }
}

object contenedorPortuario {
	var property carga = []
	
	method peso() { return 100 + carga.sum({cosa => cosa.peso()})}
	method nivelPeligrosidad() { return if (carga.isEmpty()) { 0 }
			else { self.cosaMasPeligrosa() }
	}
	method cosaMasPeligrosa(){
		 return carga.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}
	method cargar(cosa){
		carga.add(cosa)
	}
	method descargar(cosa){
		carga.remove(cosa)
	}
	method bultos() { return 1 + carga.sum({cosa => cosa.bulto()}) }
	method cambiar() { carga.forEach({cosa => cosa.cambiar()}) }
}

object residuosRadioactivos{
	var property peso = 50
	
	method nivelPeligrosidad() { return 200 }
	method bultos() { return 1 }
	method cambiar() { peso += 15}
}

object embalajeDeSeguridad{
	var property cosaEmbalada = null
	
	method embalar(cosa) { cosaEmbalada = cosa }
	method peso() { cosaEmbalada.peso() }
	method nivelPeligrosidad() { return cosaEmbalada.nivelPeligrosidad() / 2 }
	method bultos() { return 2}
	method cambiar() { /* No hace nada */}
}