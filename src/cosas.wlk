object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() { return 1 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() { return 2 }
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 1
	
	method peso() { return cantidadDeLadrillos * 2 }
	method nivelPeligrosidad() { return 2 }
	method bulto() { return 1 }
}

object arenaGranel {
	var property peso = 10
	
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1 }
}

object bateriaAntiaerea {
	var cargadaConMisiles = false
	
	method peso(){ return if (cargadaConMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (cargadaConMisiles) { 100 } else { 0 } }
	method tieneMisiles() { cargadaConMisiles = not cargadaConMisiles}
	method bulto() { return if (cargadaConMisiles) { 2 } else { 1 }
	}
}

object contenedorPortuario {
	var property carga = []
	
	method peso() { return 100 + carga.sum({cosa => cosa.peso()})}
	method nivelPeligrosidad() { return if (carga.isEmpty()) { 0 }
			else { carga.max({cosa => cosa.nivelPeligrosidad()})}
	}
	method cargar(cosa){
		carga.add(cosa)
	}
	method descargar(cosa){
		carga.remove(cosa)
	}
	method bulto() { return 1 + carga.sum({cosa => cosa.bulto()}) }
}

object residuosRadioactivos{
	var property peso = 50
	
	method nivelPeligrosidad() { return 200 }
	method bulto() { return 1 }
}

object embalajeDeSeguridad{
	var property cosaEnvuelta = null
	
	method peso() { cosaEnvuelta.peso() }
	method nivelPeligrosidad() { return cosaEnvuelta.nivelPeligrosidad() / 2 }
	method envolver(cosa) { cosaEnvuelta = cosa }
	method bulto() { return 2}
}