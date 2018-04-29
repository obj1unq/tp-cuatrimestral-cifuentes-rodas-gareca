// ---------------------------------------------------------------------------------------------------------------
class Armadura {

	var refuerzo = ninguna
	const imagen = "Armadura.png"
	const posicion = self.posicionRamdon()
	const nombre = ""

	/*Cambia el refuerzo de la armadura, este metodo se hace solo para realizar los tests*/
	method cambiarRefuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}

	/*Metodo utilizado para las coliciones con el capo que la encuentra*/
	method encontradoPor(capo) {
		capo.obtenerUnArtefacto(self)
		game.removeVisual(self)
	}

	method posicionRamdon() {
		var x = 1.randomUpTo(15)
		var y = 1.randomUpTo(15)
		return game.at(x, y)
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

