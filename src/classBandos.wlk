class Bandos {

	var property tersoro = null
	var property recursos = null
	var property miembros = #{}

	method agregarCapo(_capo) {
		miembros.add(_capo)
		_capo.seIntegraEnUnBando(self)
	}

}

