//CORRECCION Entrega 1: nota MB. hay algunos detalles técnicos que corregir, y algunas sugerencias para mejorar. 
//CORRECCION: Todos los comentarios del docente comienzan con "CORRECCION: "


object rolando {

//CORRECCION: Hubiera quedado mejor que los mensajes sean luchaBase y lucha, como pide el enunciado, en lugar de lucha y valorLucha	


var property lucha = 3
var property hechiceria = 1
var artefactos = #{}



	/*Incrementa el valor de lucha de rolando en 1 */
	method incrementarValorBaseDeLucha() {lucha++}
	
	
	/*Incrementa el valor de hechiceria  de rolando en 1 */
	method incrementarValorBaseDeHechiceria() { hechiceria++}
	
	
	/*Agrega un artefacto a la bolsa de rolando */
	//CORRECCION: este método es una orden, por lo tanto no se debe usar la forma con =, ya que estaría devoviendo algo
	//CORRECCION:La forma correcta de escribir este método es: 
	//CORRECCION:method obtenerUnArtefacto(_artefacto) { artefactos.add(_artefacto) }
	//CORRECCION: revisar que pasa en más lados.
	
	
	method obtenerUnArtefacto(_artefacto) = artefactos.add(_artefacto)
		
	
	 	//CORRECCION: la forma corta de consultas (usando el =) hacé implícitamente el return.
 		//CORRECCION: el método debería ser: 
 		//CORRECCION:	method artefactosReunidos() = artefactos
 		//CORRECCION: o
 		//CORRECCION:  method artefactosReunidos() { return artefactos }
 		//CORRECCION: Revisar que pasa en más lados.
	
	/*Retorna todos los artefactos reunidos por rolando*/
	method artefactosReunidos() = return artefactos
	
	
	/*Retorna la sumatoria de valor de lucha que otorga los artefactos */
	method valorLuchaArtefactos()= artefactos.sum({artefacto =>  artefacto.puntosDeLucha(self)})

	
	/*Retorna la sumatoria de valor de hechiceria que otorga los artefactos */
	method valorHechiceriaArtefactos()=artefactos.sum({artefacto =>  artefacto.puntosDeHechiceria(self)})
	
	
	/*Retorna el valor total de lucha  de rolando  el cual esta compuesto por el 
	 * valor base y el valor que le da los artefactos equipados*/
	method valorLucha() = return lucha + self.valorLuchaArtefactos()
	
	
	/*Retorna el valor total de hechiceria  de rolando  el cual esta compuesto por el 
	 * valor base y el valor que le da los artefactos equipados*/
	method valorHechiceria() = return hechiceria + self.valorHechiceriaArtefactos()
	
	
	/*Retorna el artefacto cuya suma de puntos (hechiceria y lucha) es la mas alta del conjunto de artefactos */
	method elMejorArtefacto(exceptuado)= artefactos.filter({artefacto => artefacto != exceptuado})
	.max({artefacto =>  artefacto.totalPuntosAgrega(self)})
	
	
	/*Encuentra un elemento del bando del sur*/
	method encontrarElemento(_elemento){
			_elemento.encontradoPor(self)
			}
	
	
			
}
//CORRECCION: Para la próxima entrega usen más de un archivo wlk. Por ejemplo, separar los artefactos de los capos. 


//-----------------------------------------------------------------------------------------------------------
object espadaDelDestino{
	
	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo)= return 3
	
	/*Retorna los puntos de hechiceria que da este artefacto */
	method puntosDeHechiceria(capo) = return 0
	
	
	//CORRECCION: para la próxima entrega ya tienen herramientas para no tener que duplicar este método en todos los artefactos, cámbienlo.
	
	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = return self.puntosDeHechiceria(capo)+self.puntosDeLucha(capo)
}
//----------------------------------------------------------------------------------------------------------
object libroDeHechizos{

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeHechiceria(capo) = return capo.hechiceria()
	
	/*Retorna los puntos de hechiceria que da este artefacto*/
	method puntosDeLucha(capo)= return 0 
	
	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = return self.puntosDeHechiceria(capo)+self.puntosDeLucha(capo)
}

//-----------------------------------------------------------------------------------------------------------
 object collarDivino{
 	
 
 	/*Retorna los puntos de lucha que da este artefacto*/
 	method puntosDeLucha(capo)= return 1
 	
 	/*Retorna los puntos de hechiceria que da este artefacto*/
 	method puntosDeHechiceria(capo) = return 1
 	
 	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
 	method totalPuntosAgrega(capo) = return self.puntosDeHechiceria(capo)+self.puntosDeLucha(capo)
 }
 
 //---------------------------------------------------------------------------------------------------------------
 object armadura{
 	
 var refuerzo = ninguna

	/*Cambia el refuerzo de la armadura, este metodo se hace solo para realizar los tests*/
	method cambiarRefuerzo(_refuerzo) {refuerzo = _refuerzo}
	
	
 	/*Retorna los puntos de lucha que da este artefacto*/
 	method puntosDeLucha(capo)= return 2 + refuerzo.puntosLuchaExtra(capo)
 	
 	/*Retorna los puntos de hechiceria que da este artefacto*/
 	method puntosDeHechiceria(capo) = return  refuerzo.puntosHechiceriaExtra(capo)
 	
 	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
 	method totalPuntosAgrega(capo) = return self.puntosDeHechiceria(capo)+self.puntosDeLucha(capo)
 }
 
 //-------------------------------------------------------------------------------------------------------------
 object cotaDeMalla{
 		
 		/*agrega puntos extra de lucha a la armadura*/
 		method puntosLuchaExtra(capo) = return 1
 		
 		/*Agrega puntos extra a la armadura*/
 		method puntosHechiceriaExtra(capo) = return 0
 	
 }
 
 //-------------------------------------------------------------------------------------------------------------
 object bendicion{
 		
 		/*agrega puntos extra de lucha a la armadura*/
 		method puntosLuchaExtra(capo) = return 0
 		
 		/*Agrega puntos extra a la armadura*/
 		method puntosHechiceriaExtra(capo) = return 1
 	
 }
 
 //-------------------------------------------------------------------------------------------------------------
 object hechizo{
 	
 		/*agrega puntos extra de lucha a la armadura*/
 		method puntosLuchaExtra(capo) = return 0
 		
 		/*Agrega puntos extra a la armadura*/
 		method puntosHechiceriaExtra(capo) { 
 			//CORRECCION: indentar mejor.
 			//CORRECCION: un chiche: usar el if como una expresión (como el ifelse de intro): return if(capo.hechiceria()>3) 2 else 0
 		if (capo.hechiceria()>3) {
 			return 2
 			}else{
 				return 0
 			}
 			}
 	
 }
 
 //-------------------------------------------------------------------------------------------------------------
 object ninguna{

 		/*agrega puntos extra de lucha a la armadura*/
 		method puntosLuchaExtra(capo) = return 0 
 		
 		/*Agrega puntos extra a la armadura*/
 		method puntosHechiceriaExtra(capo) = return 0
 	
 }
 
 //--------------------------------------------------------------------------------------------------------------
 
 object espejoFantastico{
 	
 	/*Retorna los puntos de lucha que da este artefacto*/
 	method puntosDeLucha(capo){
 		try{
 		return capo.elMejorArtefacto(self).puntosDeLucha(capo)
 		}catch e{
 			return 0
 		}
 		}
 		
 	/*Retorna los puntos de hechiceria que da este artefacto*/	
 	method puntosDeHechiceria(capo){
 		try{
 		return capo.elMejorArtefacto(self).puntosDeHechiceria(capo)
 		}catch e{
 			return 0
 		}
 		}
 		//CORRECCION: Esta manera de usar excepciones es medio peligrosa, porque el si el problema es que no tiene artefactos anda todo bien, pero también podría pasar
 		//CORRECCION: que haya otro problema (un artefacto que anda mal por ejemplo) y te estás comiendo el problema.
 		//CORRECCION: como regla general, si se puede resolver el problema por vias normales (sin tener que atrapar un error), utilizamos ese camino.
 		//CORRECCION: Una manera de resolverlo es delegar mejor en el capo para que él internamente sepa si tiene artefactos o no.
 		//CORRECCION: return capo.puntosDeHechiceriaDelMejorArtefacto(self)
 		//CORRECCION: object rolando {
 		//CORRECCION:	method puntosDeHechiceriaDelMejorArtefacto(exceptuado) {
 		//CORRECCION:		var artefactosValidos = artefactos.filter({art => atr != exceptuado})
 		//CORRECCION:		return if artefactosValidos.isEmpty() 0 else artefactosValidos.map({art => art.punstoDeHechiceria()}).max()
 		//CORRECCION:	}
 		//CORRECCION:}
 		//CORRECCION: Hay muchas otras alternativas sin necesidad de caer en el catch
 
 
 }
 
 
//---------------------------------------------------------------------------------------------------------------

object bandoDelSur{

var property tesoro = 0
var property reservasDeCarbon =0

/*Aumenta el valor del tesoro*/
method aumentarTesoro(){
	tesoro +=100
	}
	
/*Aumenta el valor del cumulo de carbon*/
method aumentarReservasDeCarbon(){
	reservasDeCarbon +=50
	}

}
 
//-----------------------------------------------------------------------------------------------------------------
object cumuloDeCarbon{
	
	/*Aumenta las reservas de carbon del bando del sur*/
	method encontradoPor(capo){
		bandoDelSur.aumentarReservasDeCarbon()
		}	
} 

//------------------------------------------------------------------------------------------------------------------
 
object cofresito{
	
	/*Aumenta las reservas de oro del bando del sur*/
	method encontradoPor(capo){
		bandoDelSur.aumentarTesoro()
		}
		
}

//---------------------------------------------------------------------------------------------------------------
 
object viejoSabio{
	
	/*Aumenta el valor base de hechiceria y lucha del capo que lo encuentra*/
	method encontradoPor(capo){
		capo.incrementarValorBaseDeHechiceria()
		capo.incrementarValorBaseDeLucha()
		}
	
}
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 