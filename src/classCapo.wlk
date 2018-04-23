class Capo{
	var property luchaBase = 3
	var property hechiceriaBase = 1
	var property artefactos = #{}
	var property bando =null
	
	
	/*Incrementa el valor de lucha de rolando en 1 */
	method incrementarValorBaseDeLucha() {
		luchaBase++
	}

	/*Incrementa el valor de hechiceria  de rolando en 1 */
	method incrementarValorBaseDeHechiceria() {
		hechiceriaBase++
	}

	/*Agrega un artefacto a la bolsa de rolando */
	method obtenerUnArtefacto(_artefacto){
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
	method hechiceria() =  hechiceriaBase + self.valorHechiceriaArtefactos()

	/*Retorna el artefacto cuya suma de puntos (hechiceria y lucha) es la mas alta del conjunto de artefactos */
	method elMejorArtefacto(exceptuado) = artefactos.filter({ artefacto => artefacto != exceptuado }).max({ artefacto => artefacto.totalPuntosAgrega(self) })

	/*Encuentra un elemento del bando del sur*/
	method encontrarElemento(_elemento) {
		_elemento.encontradoPor(self)
	}

	method seIntegraEnUnBando(_bando){
		bando=_bando
	}

}





