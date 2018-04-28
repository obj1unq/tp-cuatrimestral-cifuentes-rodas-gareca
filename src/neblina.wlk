import capo.*
import artefactos.*
import cofresito.*
import cumuloDeCarbon.*

class Neblina {

	/* PRECONDICION: Cada instancia no puede tener cosasOcultas vacia
	 * 
	 */
	var cosasOcultas = []

	method encontradoPor(_capo) {
		// Le dice al capo que cosas encuentra
		cosasOcultas.foreach({ cosa => _capo.encontrarElemento(cosa)})
	}

	method agregarCosaOculta(_cosa) {
		cosasOcultas.add(_cosa)
	}

/*
 * 	method cosasQueEncuentra(_capo) {
 * 		// Crea una sublista de cosasOcultas
 * 		return cosasOcultas.subList(self.primeraMitad(), self.segundaMitad())
 * 	}

 * 	method primeraMitad() {
 * 		// Genera un numero entero desde 0 hasta la primera mitad de una lista
 * 		return 0.randomUpTo(cosasOcultas.size() / 2)
 * 	}

 * 	method segundaMitad() {
 * 		// Genera un numero entero desde la mitad de una lista hasta el tamaño total
 * 		return cosasOcultas.size() / 2.randomUpTo(cosasOcultas.size())
 * 	}


 * 	method cosasQueEncuentra2(_capo) {
 * 		return listaDeRandom.foreach({numero => numero.generarRandom()})
 * 	}

 * 	
 * 	method tomarUnElementoAlAzarDeLista(){
 * 		return cosasOcultas.get(0.randomUpTo(cosasOcultas.size()))
 * 	}

 * 	method rango(){
 * 		listaDeRandom = [0,(0.randomUpTo(cosasOcultas.size()).roundUp())]
 * 	}
 */
}

