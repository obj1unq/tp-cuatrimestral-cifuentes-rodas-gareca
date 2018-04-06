
object rolando {
	
var lucha = 3
var hechiceria = 1
var artefactos = #{}



	/*Incrementa el valor de lucha de rolando en 1 */
	method incrementarValorBaseDeLucha() {lucha++}
	
	
	/*Incrementa el valor de hechiceria  de rolando en 1 */
	method incrementarValorBaseDeHechiceria() { hechiceria++}
	
	
	/*Agrega un artefacto a la bolsa de rolando */
	method obtenerUnArtefacto(_artefacto) = artefactos.add(_artefacto)
		
	
	/*Retorna todos los artefactos reunidos por rolando*/
	method artefactosReunidos() = return artefactos
	
	
	/*Retorna el valor base de lucha de rolando */
	method vaLorBaseLucha()= return lucha
	
	
	/*Retorna el valor base de hechiceria de rolando */
	method valorBaseHechiceria() = return hechiceria
	
	
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
			_elemento.encontrar(self)
			}
			
}
//-----------------------------------------------------------------------------------------------------------
object espadaDelDestino{
	
	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeLucha(capo)= return 3
	
	/*Retorna los puntos de hechiceria que da este artefacto */
	method puntosDeHechiceria(capo) = return 0
	
	/*Retorna la suma de puntos  de hechiceria y lucha que da este artefacto*/
	method totalPuntosAgrega(capo) = return self.puntosDeHechiceria(capo)+self.puntosDeLucha(capo)
}
//----------------------------------------------------------------------------------------------------------
object libroDeHechizos{

	/*Retorna los puntos de lucha que da este artefacto*/
	method puntosDeHechiceria(capo) = return capo.valorBaseHechiceria()
	
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
 		if (capo.valorBaseHechiceria()>3) {
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
 		return capo.elMejorArtefacto(self).puntosDeLucha(capo)
 		}
 		
 	/*Retorna los puntos de hechiceria que da este artefacto*/	
 	method puntosDeHechiceria(capo){
 		return capo.elMejorArtefacto(self).puntosDeHechiceria(capo)
 		}
 }
 
 
//---------------------------------------------------------------------------------------------------------------

object bandoDelSur{

var tesoro = 0
var reservasDeCarbon =0

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
	method encontrar(capo){
		bandoDelSur.aumentarReservasDeCarbon()
		}	
} 

//------------------------------------------------------------------------------------------------------------------
 
object cofresito{
	
	/*Aumenta las reservas de oro del bando del sur*/
	method encontrar(capo){
		bandoDelSur.aumentarTesoro()
		}
		
}

//---------------------------------------------------------------------------------------------------------------
 
object viejoSabio{
	
	/*Aumenta el valor base de hechiceria y lucha del capo que lo encuentra*/
	method encontrar(capo){
		capo.incrementarValorBaseDeHechiceria()
		capo.incrementarValorBaseDeLucha()
		}
	
}
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 