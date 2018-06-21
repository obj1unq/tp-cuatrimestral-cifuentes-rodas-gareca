class CumuloDeCarbon {

	// TODO Esta property no se usa.
	var cantidadDeCarbon = 50

	/*Aumenta las reservas de carbon del bando*/
	method encontradoPor(capo) {
		capo.bando().aumentarReservasDeCarbon(self.cantidadDeCarbon())
		game.removeVisual(self)
	}

	method cantidadDeCarbon() {
		return cantidadDeCarbon
	}

}

