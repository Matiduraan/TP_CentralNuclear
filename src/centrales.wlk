import ciudades.*
import turbinas.*

object centralAtomicaBurns {
	
	var varillas = 0
	const ciudad = springfield
	
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
	const ciudad = springfield
	
	method capacidad(unaCapacidad){
		capacidad = unaCapacidad
	}
	
	method produccionEnergetica() {
		return 0.5 + capacidad * ciudad.riquezaDelSuelo()
	}
	
	method esContaminante(){
		return true
	}
	
}

object centralEolicaElSuspiro {
	
	
	
	var turbinas = [turbinaDe02]
	const ciudad = springfield
	
	method produccionEnergetica(){
		return (turbinas.map({turbina => turbina.produccionDeTurbina(ciudad.velocidadDelViento())})).sum()
	}
	
	method esContaminante(){
		return false
	}
}

object centralHidroElectrica {
	const ciudad = albuquerque
}
