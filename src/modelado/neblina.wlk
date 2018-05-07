class Neblina {

	/* PRECONDICION: Cada instancia no puede tener cosasOcultas vacia
	 * 
	 */
	var cosasOcultas = []
	var property nombre = ""

	method encontradoPor(_capo) {
		// Le dice al capo que cosas encuentra
		cosasOcultas.forEach({ cosa => _capo.encontrarElemento(cosa)})
		game.removeVisual(self)
	}

	method agregarCosaOculta(_cosa) {
		cosasOcultas.add(_cosa)
	}

}

