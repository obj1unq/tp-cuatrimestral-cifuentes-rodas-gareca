import artefactos.*

class Capo {

	var property estaVivo = true
	var property luchaBase = 3
	var property hechiceriaBase = 1
	var property artefactos = #{}
	var property bando = ""
	var property nombre = ""

	/*Incrementa el valor de lucha de un capo en 1 si esta vivo */
	method incrementarValorBaseDeLucha() {
		if (self.estaVivo()) {
			luchaBase++
		} else {
			throw new Exception("esta muerto")
		}
	}

	/*Este methodo suma a la luchaBase de capo el numero que se le pasa por parametro
	 * Este metodo es usado por el viejo sabio*/
	method incrementarValorBaseDeLucha(unNum) {
		if (estaVivo) luchaBase += unNum else throw new Exception("esta muerto")
	}

	/*Incrementa el valor de hechiceria  de un capo en 1 si esta vivo */
	method incrementarValorBaseDeHechiceria() {
		if (estaVivo) hechiceriaBase++ else throw new Exception("esta muerto")
	}

	/*Agrega un artefacto a la bolsa de un capo si esta vivo */
	method obtenerUnArtefacto(_artefacto) {
		if (estaVivo) artefactos.add(_artefacto) else throw new Exception("esta muerto")
	}

	/*Retorna todos los artefactos reunidos por rolando*/
	method artefactosReunidos() {
		return self.artefactos()
	}

	/*Retorna la sumatoria de valor de lucha que otorga los artefactos */
	method valorLuchaArtefactos() = artefactos.sum({ artefacto => artefacto.puntosDeLucha(self) })

	/*Retorna la sumatoria de valor de hechiceria que otorga los artefactos */
	method valorHechiceriaArtefactos() = artefactos.sum({ artefacto => artefacto.puntosDeHechiceria(self) })

	/*Retorna el valor total de lucha  de rolando  el cual esta compuesto por el 
	 * valor base y el valor que le da los artefactos equipados*/
	method lucha() {
		return self.luchaBase() + self.valorLuchaArtefactos()
	}

	/*Retorna el valor total de hechiceria  de rolando  el cual esta compuesto por el 
	 * valor base y el valor que le da los artefactos equipados*/
	method hechiceria() {
		return self.hechiceriaBase() + self.valorHechiceriaArtefactos()
	}

	/*Retorna el artefacto cuya suma de puntos (hechiceria y lucha) es la mas alta del conjunto de artefactos, 
	 * no evalua al artefacto exceptuado */
	method elMejorArtefacto(exceptuado) {
		if (artefactos.isEmpty() || artefactos.size() == 1 && artefactos.contains(exceptuado)) {
			return artefactoNeutro
		} else {
			return artefactos.filter({ artefacto => artefacto != exceptuado }).max({ artefacto => artefacto.totalPuntosAgrega(self) })
		}
	}

	/*un capo se encuentra con cualquier cosa si esta vivo*/
	method encontrarElemento(_elemento) {
		if (estaVivo) {
			_elemento.encontradoPor(self)
		} else {
			throw new Exception("esta muerto")
		}
	}

	method seIntegraA(_bando) {
		if (estaVivo) {
			bando = _bando
		} else {
			throw new Exception("esta muerto")
		}
	}

	// Si un capo se encuentra con otro de su mismo bando, le regala su equipamiento.Pero si es de otro bando pelea  
	method encontradoPor(_capo) {
		if (self.esDelMismoBando(_capo)) {
			self.regalarArtefactos(_capo)
		} else {
			self.pelea(_capo)
		}
	}

	// Da su equipamiento a otro capo
	method regalarArtefactos(_capo) {
		_capo.resivirArtefactos(self.artefactos())
		artefactos.removeAll(self.artefactos())
	}

	// Un capo puede resivir los artefactos de otro capo
	method resivirArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)
	}

	// Retorna el resultado de sumar los puntos de hechiceria y de lucha
	method sumaDeAtributos() {
		return self.lucha() + self.hechiceria()
	}

	// Denota true si un capo pertenece al mismo bando que otro capo
	method esDelMismoBando(_capo) = self.bando() == _capo.bando()

	// Un capo puede peliar contra otro capo. Vive el q tiene mas puntos de lucha y hechiceria
	method pelea(_capo) {
		if (self.sumaDeAtributos() < _capo.sumaDeAtributos()) {
			self.muerte(self)
		} else {
			_capo.muerte(_capo)
		}
	}

	// Cambia el estado de un capo de vivo a muerto
	method muerte(capo) {
		capo.estaVivo(false)
	}

	method imagen() = self.nombre() + "-" + self.estaVivo() + ".png"

}

//----------------------------------------------------------------------------------------------------------
object gameOver {

	method imagen() {
		return ("finDelJuego.png")
	}

}

