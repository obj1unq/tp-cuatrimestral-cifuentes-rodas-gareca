class CumuloDeCarbon {

	var property cantidadDeCarbon = 50

	/*Aumenta las reservas de carbon del bando*/
	method encontradoPor(capo) {
		capo.bando().aumentarReservasDeCarbon()
			game.removeVisual(self)
	}

}

