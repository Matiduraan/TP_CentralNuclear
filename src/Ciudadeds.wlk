import Centrales.*

object springfield {
	const velocidadDelViento = 10
	const riquezaDelSuelo = 90
	var centralesElectricas = [centralAtomicaBurns,centralDeCarbonExBosque,centralEolicaElSuspiro]
	
	method velocidadDelViento(){
		return velocidadDelViento
	}
	
	method riquezaDelSuelo(){
		return riquezaDelSuelo
	}
	
	method produccionEnergetica(central){
		centralesElectricas.contains(central)
		return central.produccionEnergetica()
	}
	
	method centralesContaminantes(){
		return centralesElectricas.filter({central => central.esContaminante()})
	}
	
	method cubreLasNecesidades(necesidad){
		var energiaGenerada = centralesElectricas.map({central => central.produccionEnergetica()}).sum()
		return necesidad <= energiaGenerada
	}
	
}


