//---------------------------------------------------------------------------------------------------------------
class ViejoSabio {

	const imagen = ""
	const posicion = self.posicionRamdon()
	const nombre = ""

	/*Aumenta el valor base de hechiceria y lucha del capo que lo encuentra*/
	method encontradoPor(capo) {
		capo.incrementarValorBaseDeHechiceria()
		capo.incrementarValorBaseDeLucha(ayudanteDeSabio.puntosLuchaAdicional())
		game.removeVisual(self)
	}
/*Genera una posicion al azr para la instancia del viejo sabio*/
	method posicionRamdon() {
		var x = 1.randomUpTo(12)
		var y = 1.randomUpTo(12)
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

