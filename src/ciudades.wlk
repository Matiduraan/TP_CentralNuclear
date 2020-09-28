import centrales.*

object springfield {
	const velocidadDelViento = 10
	const riquezaDelSuelo = 0.9
	var centrales = []
	var necesidadEnergetica = 0
	
	method riquezaDelSuelo() = riquezaDelSuelo

	method velocidadDelViento() = velocidadDelViento
	
	method centrales(unasCentrales){
		centrales.addAll(unasCentrales)
	}
	
	method produccionEnergetica(unaCentral) {
		centrales.contains(unaCentral)
		return unaCentral.produccionEnergetica(self)
	}
	
	method necesidadEnergetica(nuevaNecesidad){
		necesidadEnergetica = nuevaNecesidad
	}
	
	method centralesContaminantes() {
		return centrales.filter({central=>central.esContaminante()})
	}
		
	method cubrioNecesidadEnergetica() {
		return self.energiaProducidaPorLasCentrales(centrales) >= necesidadEnergetica
	}
	
	method energiaProducidaPorLasCentrales(centralesElectricas) {
		return (centralesElectricas.map({central => central.produccionEnergetica(self)})).sum()
	}
				
	method estaAlHorno() {
		return self.aportanMasDeLaMitadNecesaria() || centrales.all({central => central.esContaminante()})
	}
		 
	method energiaDeContaminantes() {
		return self.energiaProducidaPorLasCentrales(self.centralesContaminantes())
	}
	
	method aportanMasDeLaMitadNecesaria() { 
		return self.energiaDeContaminantes() >= (0.5*necesidadEnergetica) 	
	}
	
	method centralMasProductora() {
		return centrales.max({central=>central.produccionEnergetica(self)})
	}
	
}

object albuquerque {
	const caudalRio = 150
	var central = centralHidroElectrica

	method centralMasProductora () = central

}
