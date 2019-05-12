import cosas.*

object camion {
	var property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method peso() { return 1000 }
	
	method pesoMaximo() { return 2500 }
	
	method pesoTotal(){
		return self.peso() + cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() > self.pesoMaximo()
	}
	
	method objetosPeligrosos(nivel){
		cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		cosas.filter({objeto => objeto.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad})
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa => cosa.peso() > min and cosa.peso() < max})
	}
	
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
	
	method totalBultos(){
		
	}
}
