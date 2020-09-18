  
import ciudades.*
import turbinas.*

object centralAtomicaBurns {
	
	var varillas = 0
	
	method varillas(cantidadVarillas) {
		varillas = cantidadVarillas
	}
	
	method produccionEnergetica(unaCiudad) {
		return 0.1*varillas
	}
	
	method esContaminante() = varillas > 20	
}

object centralDeCarbonExBosque {

	
	var capacidad = 0
	
	method capacidad(unaCapacidad){
		capacidad = unaCapacidad
	}
	
	method ciudad(unaCiudad){
		ciudad = unaCiudad
	}
		
	method produccionEnergetica(unaCiudad) {
		return 0.5 + capacidad * unaCiudad.riquezaDelSuelo()
	}
	
	method esContaminante() = true
		
}

object centralEolicaElSuspiro {
	
	var turbinas = turbinaDe02
		
	method produccionEnergetica(unaCiudad){
		return turbinas.sum({turbina => turbina.produccionDeTurbina(unaCiudad.velocidadDelViento())})
	}
	
	method esContaminante() = false
		
	method ciudad(unaCiudad){
		ciudad = unaCiudad
	}
}

object centralHidroElectrica {

	method produccionEnergetica(unaCiudad) {
	}

	method esContaminante() {
	}
}
