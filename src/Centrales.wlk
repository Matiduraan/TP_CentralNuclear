import Ciudadeds.*
import Turbinas.*

object centralAtomicaBurns {
	
	var varillas=10
	var capacidad=10
	const ciudad = springfield
	
	method produccionEnergetica(){
		return 0.1*varillas
		
	}
	
	method esContaminante(){
		return varillas > 20
	}	
}

object centralDeCarbonExBosque {

	var varillas=10
	var capacidad=10
	const ciudad = springfield
	
	method produccionEnergetica(){
		return 0.5 + capacidad * ciudad.riquezaDelSuelo()
	}
	
	method esContaminante(){
		return true
	}
	
}

object centralEolicaElSuspiro {
	
	var varillas=10
	var capacidad=10
	var turbinas=[turbinaDe02]
	const ciudad = springfield

	
	method produccionEnergetica(){
		return (turbinas.map({turbina => turbina.produccion(ciudad.velocidadDelViento())})).sum()
	}
	
	method esContaminante(){
		
			return false
	}
	
}