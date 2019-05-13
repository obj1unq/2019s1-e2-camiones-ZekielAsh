import cosas.*

object camion {
	var property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambiar()
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
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({objeto => objeto.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
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
		return cosas.sum({cosa => cosa.bultos()})
	}
	
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
}
