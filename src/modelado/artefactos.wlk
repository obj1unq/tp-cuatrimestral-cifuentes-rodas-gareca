class Artefacto {

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	// TODO Este código está repetido en varios lugares, ahora que sabemos herencia podemos evitarlo.
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
	}

	method puntosDeHechiceria(capo) = 0

	method puntosDeLucha(capo) = 0

	method imagen()

	// CORRECCION: para la próxima entrega ya tienen herramientas para no tener que duplicar este método en todos los artefactos, cámbienlo.
	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

//-------------------------------------------------------------------------------------------------------------------------------------
object espadaDelDestino inherits Artefacto {

	const property nombre = "Espada del Destino"

	/*Retorna los puntos de lucha que da este artefacto*/
	override method puntosDeLucha(capo) {
		return 3
	}

	/*Retorna la imagen de la espada del destino*/
	override method imagen() {
		return "espada.png"
	}

}

//--------------------------------------------------------------------------------------------------------------------------
object libroDeHechizos inherits Artefacto {

	const property nombre = "Libro de hechizos"

	/*Retorna los puntos de lucha que da este artefacto*/
	override method puntosDeHechiceria(capo) = capo.hechiceriaBase()

	/*Retorna la imagen de la espada del destino*/
	override method imagen() {
		return "LibroDeHechizos.png"
	}

}

//----------------------------------------------------------------------------------------------------------
object collarDivino inherits Artefacto {

	const property nombre = "Collar divino"

	/*Retorna la imagen de la espada del destino*/
	override method imagen() {
		return "collar.png"
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	override method puntosDeLucha(capo) = 1

	/*Retorna los puntos de hechiceria que da este artefacto*/
	override method puntosDeHechiceria(capo) = 1

}

// --------------------------------------------------------------------------------------------------------------
object espejoFantastico inherits Artefacto {

	const property nombre = "Espejo fantastico"

	/*Retorna la imagen de la espada del destino*/
	override method imagen() {
		return "EspejoFantastico.png"
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	override method puntosDeLucha(capo) {
		return capo.elMejorArtefacto(self).puntosDeLucha(capo)
	}

	/*Retorna los puntos de hechiceria que da este artefacto*/
	override method puntosDeHechiceria(capo) {
		return capo.elMejorArtefacto(self).puntosDeHechiceria(capo)
	}

}

//-----------------------------------------------------------------------------------------------------------
object artefactoNeutro inherits Artefacto {

	const property nombre = "Artefacto neutro"

	/*Retorna la imagen de la espada del destino*/
	override method imagen() {
		return null
	}

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

