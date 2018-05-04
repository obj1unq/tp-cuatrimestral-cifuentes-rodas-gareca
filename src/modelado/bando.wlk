class Bando {

	var property tesoro = 0
	var property recursos = 0
	var property miembros = #{}

	/*Agrega un capo al bando */
	method agregarCapo(_capo) {
		miembros.add(_capo)
		_capo.seIntegraA(self)
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







