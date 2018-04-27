object espadaDelDestino {

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

object artefactoNeutro {

	method puntosDeLucha(capo) = 0

	method puntosDeHechiceria(capo) = 0

	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

//----------------------------------------------------------------------------------------------------------
object libroDeHechizos {

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeHechiceria(capo) = capo.hechiceriaBase()

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeLucha(capo) = 0

	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

//-----------------------------------------------------------------------------------------------------------
object collarDivino {

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo) = 1

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeHechiceria(capo) = 1

	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

// ---------------------------------------------------------------------------------------------------------------
object armadura {

	var refuerzo = ninguna

	/*Cambia el refuerzo de la armadura, este metodo se hace solo para realizar los tests*/
	method cambiarRefuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo) = 2 + refuerzo.puntosLuchaExtra(capo)

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeHechiceria(capo) = refuerzo.puntosHechiceriaExtra(capo)

	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = self.puntosDeHechiceria(capo) + self.puntosDeLucha(capo)

}

// -------------------------------------------------------------------------------------------------------------
object cotaDeMalla {

	/*agrega puntos extra de lucha a la armadura*/
	method puntosLuchaExtra(capo) = 1

	/*Agrega puntos extra a la armadura*/
	method puntosHechiceriaExtra(capo) = 0

}

// -------------------------------------------------------------------------------------------------------------
object bendicion {

	/*agrega puntos extra de lucha a la armadura*/
	method puntosLuchaExtra(capo) = 0

	/*Agrega puntos extra a la armadura*/
	method puntosHechiceriaExtra(capo) = 1

}

// -------------------------------------------------------------------------------------------------------------
object hechizo {

	/*agrega puntos extra de lucha a la armadura*/
	method puntosLuchaExtra(capo) = 0

	/*Agrega puntos extra a la armadura*/
	method puntosHechiceriaExtra(capo) {
		return if (capo.hechiceriaBase() > 3) 2 else 0
	}

}

// -------------------------------------------------------------------------------------------------------------
object ninguna {

	/*agrega puntos extra de lucha a la armadura*/
	method puntosLuchaExtra(capo) = 0

	/*Agrega puntos extra a la armadura*/
	method puntosHechiceriaExtra(capo) = 0

}

// --------------------------------------------------------------------------------------------------------------
object espejoFantastico {

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo) {
		return capo.elMejorArtefacto(self).puntosDeLucha(capo)
	}

	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeHechiceria(capo) {
		return capo.elMejorArtefacto(self).puntosDeHechiceria(capo)
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
}

