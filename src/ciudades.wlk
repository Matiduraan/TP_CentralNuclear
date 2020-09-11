import centrales.*

object springfield {
	const velocidadDelViento = 10
	const riquezaDelSuelo = 90
	// const riquezaDelSuelo = 0.9
	var centrales = [centralAtomicaBurns,centralDeCarbonExBosque,centralEolicaElSuspiro]
	
	method riquezaDelSuelo() {
		return riquezaDelSuelo
	}
	
	method velocidadDelViento() {
		return velocidadDelViento
	}
	
	method produccionEnergetica(unaCentral) {
		centrales.contains(unaCentral)
		return unaCentral.produccionEnergetica()
	}
	
	method centralesContaminantes() {
		return centrales.filter({central=>central.esContaminante()})
	}
	
	method cubreLasNecesidades(necesidad){
		var energiaGenerada = centrales.map({central => central.produccionEnergetica()}).sum()
		return necesidad <= energiaGenerada
	}
	
	/*
	1ra opcion
	method cubrioNecesidadEnergetica(necesidadEnergetica) {
		var energiaProducida = (centrales.map({central => central.produccionEnergetica()})).sum()
		return energiaProducida >= necesidadEnergetica
	}
	
	2da opcion
	method cubrioNecesidadEnergetica(necesidadEnergetica) {
		return self.energiaProducidaEnLaCiudad() >= necesidadEnergetica
	}
	
	method energiaProducidaEnLaCiudad() {
		return (centrales.map({central => central.produccionEnergetica()})).sum()
	}
	*/
	
	// VER 
	
	method estaAlHorno(necesidadEnergetica) {
		return self.aportanMasDeLaMitadNecesaria(necesidadEnergetica) || centrales.all({central => central.esContaminante()})
	}
		 
	method energiaDeContaminantes() {
		return ((self.centralesContaminantes()).map({central => central.produccionEnergetica()})).sum()
	}
	
	method aportanMasDeLaMitadNecesaria(necesidadEnergetica) { 
		return self.energiaDeContaminantes() >= (1.5*necesidadEnergetica) 	
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


