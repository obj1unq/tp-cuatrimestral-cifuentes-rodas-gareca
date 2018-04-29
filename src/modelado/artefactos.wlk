object espadaDelDestino {

	const imagen = "EspadaDelDestino.png"
	const posicion =posicionRamdon.posicionRamdon()
	const nombre = "Espada Del Destino"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
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

	// CORRECCION: para la próxima entrega ya tienen herramientas para no tener que duplicar este método en todos los artefactos, cámbienlo.
	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

//--------------------------------------------------------------------------------------------------------------------------
object libroDeHechizos {

	const imagen = "LibroDeHechizos.png"
	const posicion =posicionRamdon.posicionRamdon()
	const nombre = "Libro De Hechizos"

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

}

//----------------------------------------------------------------------------------------------------------
object collarDivino {

	const imagen = "CollarDivino.png"
	const posicion = posicionRamdon.posicionRamdon()
	const nombre = "Collar divino"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
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

	const imagen = "EspejoFantastico.png"
	const posicion = posicionRamdon.posicionRamdon()
	const nombre = "Espejo Fantastico"

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
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
object posicionRamdon {

	/*Genera una posicion al azr para la armadura*/
	method posicionRamdon() {
		var x = 1.randomUpTo(15)
		var y = 1.randomUpTo(15)
		return game.at(x, y)
	}

}

// CORRECCION: Esta manera de usar excepciones es medio peligrosa, porque el si el problema es que no tiene artefactos anda todo bien, pero también podría pasar
// CORRECCION: que haya otro problema (un artefacto que anda mal por ejemplo) y te estás comiendo el problema.
// CORRECCION: como regla general, si se puede resolver el problema por vias normales (sin tener que atrapar un error), utilizamos ese camino.
// CORRECCION: Una manera de resolverlo es delegar mejor en el capo para que él internamente sepa si tiene artefactos o no.
// CORRECCION: return capo.puntosDeHechiceriaDelMejorArtefacto(self)
// CORRECCION: object rolando {
// CORRECCION:	method puntosDeHechiceriaDelMejorArtefacto(exceptuado) {
// CORRECCION:		var artefactosValidos = artefactos.filter({art => atr != exceptuado})
// CORRECCION:		return if artefactosValidos.isEmpty() 0 else artefactosValidos.map({art => art.punstoDeHechiceria()}).max()
// CORRECCION:	}
// CORRECCION:}
// CORRECCION: Hay muchas otras alternativas sin necesidad de caer en el catch
