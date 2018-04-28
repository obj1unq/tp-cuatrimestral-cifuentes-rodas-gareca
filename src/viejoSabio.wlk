//---------------------------------------------------------------------------------------------------------------
class ViejoSabio {

	const property imagen = null
	var posicion = self.posicionRamdon()

	/*Aumenta el valor base de hechiceria y lucha del capo que lo encuentra*/
	method encontradoPor(capo) {
		capo.incrementarValorBaseDeHechiceria()
		capo.incrementarValorBaseDeLucha(ayudanteDeSabio.puntosLuchaAdicional())
	}

	method posicionRamdon() {
		var x = 1.randomUpTo(15)
		var y = 1.randomUpTo(15)
		return game.at(x, y)
	}

}

//----------------------------------------------------------------------------------------------------------------------
object ayudanteDeSabio {

	var luchaAdicional = 1

	method puntosLuchaAdicional() {
		return luchaAdicional
	}

}

