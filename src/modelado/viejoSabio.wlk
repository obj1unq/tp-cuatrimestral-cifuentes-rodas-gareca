//---------------------------------------------------------------------------------------------------------------
import modelado.artefactos.*

class ViejoSabio {

	// const posicion = posicionRandom.posicionRandom()
	const property nombre = ""

	/*Aumenta el valor base de hechiceria y lucha del capo que lo encuentra*/
	method encontradoPor(capo) {
		capo.incrementarValorBaseDeHechiceria()
		capo.incrementarValorBaseDeLucha(ayudanteDeSabio.puntosLuchaAdicional())
		game.removeVisual(self)
	}

	method imagen() {
		return "oldMan" + self.nombre() + ".png"
	}

}

//----------------------------------------------------------------------------------------------------------------------
object ayudanteDeSabio {

	var luchaAdicional = 1

	method puntosLuchaAdicional() {
		return luchaAdicional
	}

}

