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
	method cubrioNecesidadEnergetica(necesidadEnergetica) {
		var energiaProducida = (centrales.map({central => central.produccionEnergetica()})).sum()
		return energiaProducida >= necesidadEnergetica
	}
	*/
	
	/* 
	no entiendo la primer parte 
	4.
	method estaAlHorno() {
		 || centrales.all({central => central.esContaminante()})
	}
	*/
	
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


