class Neblina {

	/*
	 * PROPOSITO: De la lista de cosas, elige una cantidad aleatoria de elementos con las
	 * 			que se encuentra un capo.
	 * PRECONDICION: Cada instancia no puede tener cosasOcultas vacia
	 * 
	 */
	var cosasOcultas = []

	method encontradoPor(_capo) {
		// Le dice al capo que cosas encuentra
		self.cosasQueEncuentra(_capo).foreach({ cosa => _capo.encontrarElemento(cosa)})
	}

	method cosasQueEncuentra(_capo) {
		// Crea una sublista de cosasOcultas
		return cosasOcultas.subList(self.primeraMitad(), self.segundaMitad())
	}

	method primeraMitad() {
		// Genera un numero entero desde 0 hasta la primera mitad de una lista
		return 0.randomUpTo(cosasOcultas.size() / 2)
	}

	method segundaMitad() {
		// Genera un numero entero desde la mitad de una lista hasta el tamaño total
		return cosasOcultas.size() / 2.randomUpTo(cosasOcultas.size())
	}

	method agregarCosaOculta(_cosa) {
		cosasOcultas.add(_cosa)
	}

}

