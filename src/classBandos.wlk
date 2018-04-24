class Bando {

	var property tesoro = 0
	var property recursos = 0
	var property miembros = #{}

	/*Agrega un capo al bando */
	method agregarCapo(_capo) {
		miembros.add(_capo)
		_capo.seIntegraEnUnBando(self)
	}

	/*Aumenta el valor del tesoro*/
	method aumentarTesoro(_num) {
		tesoro += _num
	}

	/*Aumenta el valor del cumulo de carbon*/
	method aumentarReservasDeCarbon() {
		recursos += 50
	}

}

class CumuloDeCarbon {

	/*Aumenta las reservas de carbon del bando*/
	method encontradoPor(capo) {
		capo.bando().aumentarReservasDeCarbon()
	}

}

class Cofresito {

	var cantidadDeOro = 100

	/*Aumenta las reservas de oro del bando del sur*/
	method encontradoPor(capo) {
		capo.bando().aumentarTesoro(cantidadDeOro)
	}

}

object cumuloDeCarbonDeReferencia{
	const property cantidadDeCarbon=50
}

