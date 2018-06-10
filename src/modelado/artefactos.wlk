object espadaDelDestino {

	const property nombre = "Espada del destino"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	// TODO Este código está repetido en varios lugares, ahora que sabemos herencia podemos evitarlo.
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo) {
		return 3
	}

	/*Retorna los puntos de hechiceria que da este artefacto */
	method puntosDeHechiceria(capo) {
		return 0
	}

	/*Retorna la imagen de la espada del destino*/
	method imagen() {
		return "espada.png"
	}

	// CORRECCION: para la próxima entrega ya tienen herramientas para no tener que duplicar este método en todos los artefactos, cámbienlo.
	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

//--------------------------------------------------------------------------------------------------------------------------
object libroDeHechizos {

	const property nombre = "Libro de hechizos"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeHechiceria(capo) = capo.hechiceriaBase()

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeLucha(capo) = 0

	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

	/*Retorna la imagen de la espada del destino*/
	method imagen() {
		return "LibroDeHechizos.png"
	}

}

//----------------------------------------------------------------------------------------------------------
object collarDivino {

	const property nombre = "Collar divino"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
	}

	/*Retorna la imagen de la espada del destino*/
	method imagen() {
		return "collar.png"
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo) = 1

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeHechiceria(capo) = 1

	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

// --------------------------------------------------------------------------------------------------------------
object espejoFantastico {

	const property nombre = "Espejo fantastico"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
	}

	/*Retorna la imagen de la espada del destino*/
	method imagen() {
		return "EspejoFantastico.png"
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo) {
		return capo.elMejorArtefacto(self).puntosDeLucha(capo)
	}

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeHechiceria(capo) {
		return capo.elMejorArtefacto(self).puntosDeHechiceria(capo)
	}

}

//-----------------------------------------------------------------------------------------------------------
object artefactoNeutro {

	/*Objeto utilizado como artefacto neutro para el method elMejor*/
	method puntosDeLucha(capo) = 0

	method puntosDeHechiceria(capo) = 0

	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

//-------------------------------------------------------------------------------------------------------------------------
object posicion {

	var property ancho = 20
	var property alto = 14

	/*Genera una posicion al azar para la armadura, artefactos y viejo sabio*/
	method posicionRandom() {
		return game.at(1.randomUpTo(ancho), 1.randomUpTo(alto))
	}

	/*Retorna una posicion fija segun las coordenadas que se les pasa como argumento*/
	method posicionFija(x, y) {
		if (x.between(1, ancho) && y.between(1, alto)) {
			return game.at(x, y)
		} else {
			throw new Exception("Los valores no pueden superar el ancho o alto de la ventana")
		}
	}

}

