  
import ciudades.*
import turbinas.*

object centralAtomicaBurns {
	
	var varillas = 0
	
	method varillas(cantidadVarillas) {
		varillas = cantidadVarillas
	}
	
	method produccionEnergetica() {
		return 0.1*varillas
	}
	
	method esContaminante(){
		return varillas > 20
	}	
}

object centralDeCarbonExBosque {

	
	var capacidad = 0
	var ciudad = springfield
	
	method capacidad(unaCapacidad){
		capacidad = unaCapacidad
	}
	
	method ciudad(unaCiudad){
		ciudad = unaCiudad
	}
		
	method produccionEnergetica() {
		return 0.5 + capacidad * ciudad.riquezaDelSuelo()
	}
	
	method esContaminante(){
		return true
	}
	
}

object centralEolicaElSuspiro {
	
	var turbinas = turbinaDe02
	var ciudad = springfield
	
	method produccionEnergetica(){
		return turbinas.sum({turbina => turbina.produccionDeTurbina(ciudad.velocidadDelViento())})
	}
	
	method esContaminante(){
		return false
	}
	
	method ciudad(unaCiudad){
		ciudad = unaCiudad
	}
}

object centralHidroElectrica {

}
