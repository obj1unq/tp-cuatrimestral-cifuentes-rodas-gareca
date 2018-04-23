import unCapo.*
import artefactos.*

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
		capo.bando().aumentarReservasDeCarbon()
		}	
} 

//------------------------------------------------------------------------------------------------------------------
 
object cofresito{
	
	/*Aumenta las reservas de oro del bando del sur*/
	method encontradoPor(capo){
		capo.bando().aumentarTesoro()
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
 