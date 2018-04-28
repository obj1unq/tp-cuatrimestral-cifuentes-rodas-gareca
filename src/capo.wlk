import artefactos.*

class Capo {
	var property estaVivo= true
	var property luchaBase = 3
	var property hechiceriaBase = 1
	var property artefactos = #{}
	var property bando = null

	/*Incrementa el valor de lucha de rolando en 1 */
	method incrementarValorBaseDeLucha() {
		luchaBase++
	}

	/*Incrementa el valor de hechiceria  de rolando en 1 */
	method incrementarValorBaseDeHechiceria() {
		hechiceriaBase++
	}

	/*Agrega un artefacto a la bolsa de rolando */
	method obtenerUnArtefacto(_artefacto) {
		artefactos.add(_artefacto)
	}

	/*Retorna todos los artefactos reunidos por rolando*/
	method artefactosReunidos() = artefactos

	/*Retorna la sumatoria de valor de lucha que otorga los artefactos */
	method valorLuchaArtefactos() = artefactos.sum({ artefacto => artefacto.puntosDeLucha(self) })

	/*Retorna la sumatoria de valor de hechiceria que otorga los artefactos */
	method valorHechiceriaArtefactos() = artefactos.sum({ artefacto => artefacto.puntosDeHechiceria(self) })

	/*Retorna el valor total de lucha  de rolando  el cual esta compuesto por el 
	 * valor base y el valor que le da los artefactos equipados*/
	method lucha() = luchaBase + self.valorLuchaArtefactos()

	/*Retorna el valor total de hechiceria  de rolando  el cual esta compuesto por el 
	 * valor base y el valor que le da los artefactos equipados*/
	method hechiceria() = hechiceriaBase + self.valorHechiceriaArtefactos()

	/*Retorna el artefacto cuya suma de puntos (hechiceria y lucha) es la mas alta del conjunto de artefactos */
	method elMejorArtefacto(exceptuado) = if (artefactos.size() > 1) artefactos.filter({ artefacto => artefacto != exceptuado }).max({ artefacto => artefacto.totalPuntosAgrega(self) }) else return artefactoNeutro

	/*un capo se encuentra con cualquier cosa */
	method encontrarElemento(_elemento) {
		_elemento.encontradoPor(self)
	}

	method seIntegraAlBando(_bando) {
		bando = _bando
	}

	method encontradoPor(_capo){
		if(self.esDelMismoBando(_capo))self.regalarArtefactos(_capo)else self.fight(_capo)
	}


	method regalarArtefactos(_capo){
		_capo.resivirArtefactos(self.artefactos())
	}

	method resivirArtefactos(_artefactos){
		artefactos.addAll(_artefactos)
	}


	method sumaDeAtributos(_capo)= _capo.lucha()+_capo.hechiceria()

	method esDelMismoBando(_capo)= self




