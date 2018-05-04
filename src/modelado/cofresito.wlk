class Cofresito {

	var property cantidadDeOro = 100

	/*Aumenta las reservas de oro del bando del sur*/
	method encontradoPor(capo) {
		capo.bando().aumentarTesoro(self.cantidadDeOro())
	}

}

