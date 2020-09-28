  
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
	
		
	method produccionEnergetica(unaCiudad) {
		return 0.5 + capacidad * unaCiudad.riquezaDelSuelo()
	}
	
	method esContaminante() = true
		
}

object centralEolicaElSuspiro {
	
	var turbinas = [turbinaDe02]
		
	method produccionEnergetica(unaCiudad){
		return turbinas.map({turbina => turbina.produccionDeTurbina(unaCiudad.velocidadDelViento())}).sum()
	}
	
	method esContaminante() = false
		

}

object centralHidroElectrica {

	method produccionEnergetica(unaCiudad) {
	}

	method esContaminante() {
	}
}
