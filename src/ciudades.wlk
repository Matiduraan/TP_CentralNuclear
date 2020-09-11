import Centrales.*


object springfield {
	const velocidadDelViento = 10
	const riquezaDelSuelo = 0.9
	var centrales = []
	
	method riquezaDelSuelo() {
		return riquezaDelSuelo
	}
	
	method velocidadDelViento() {
		return velocidadDelViento
	}
	
	method centrales(unasCentrales){
		centrales.addAll(unasCentrales)
	}
	
	method produccionEnergetica(unaCentral) {
		centrales.contains(unaCentral)
		return unaCentral.produccionEnergetica()
	}
	
	method centralesContaminantes() {
		return centrales.filter({central=>central.esContaminante()})
	}
	
	/* tu opcion
	method cubreLasNecesidades(necesidad){
		var energiaGenerada = centrales.map({central => central.produccionEnergetica()}).sum()
		return necesidad <= energiaGenerada
	}
	*/
	
	// mi opcion 
	// (queria intentar hace un energiaProducidaEnLaCiudad mas generico que le pasaba el tipo de centrales a analizar para despues en el punto 4 
	// reutilizarlo y que me busque SOLO la energia de las contaminantes pero no me salio
	
	method cubrioNecesidadEnergetica(necesidadEnergetica) {
		return self.energiaProducidaPorLasCentrales(centrales) >= necesidadEnergetica
	}
	
	method energiaProducidaPorLasCentrales(centralesElectricas) {
		return (centralesElectricas.map({central => central.produccionEnergetica()})).sum()
	}
				
	method estaAlHorno(necesidadEnergetica) {
		return self.aportanMasDeLaMitadNecesaria(necesidadEnergetica) || centrales.all({central => central.esContaminante()})
	}
		 
	method energiaDeContaminantes() {
		return self.energiaProducidaPorLasCentrales(self.centralesContaminantes())
	}
	
	method aportanMasDeLaMitadNecesaria(necesidadEnergetica) { 
		return self.energiaDeContaminantes() >= (0.5*necesidadEnergetica) 	
	}
	
	method centralMasProductora() {
		return centrales.max({central=>central.produccionEnergetica()})
	}
	
}

object albuquerque {
	const caudalRio = 150
	var central = centralHidroElectrica

	method centralMasProductora () {
		return central
	}
}
