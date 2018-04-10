// PUNTO 1: COLECCIONES
object coleccionista {
	var galeria = #{}
	var microfono = ninguno
	var estuche = ninguno
	
	method agregarElemento(unElemento) = galeria.add(unElemento)
	
	method quitarElemento(unElemento) = galeria.remove(unElemento)
	
	method objetosFragiles() = galeria.filter{elemento => elemento.esFragil(self)}
	
	method objetoFragilMasCaro() = self.objetosFragiles().max{elemento => elemento.valor(self)}
	
	method valorEnObjetosFragiles() = self.objetosFragiles().sum{elemento => elemento.valor(self)}

	method objetosDeCategoria(unaCategoria) = galeria.filter{elemento => elemento.categoria() == unaCategoria}

	method valorEnCategoria(unaCategoria) = self.objetosDeCategoria(unaCategoria).sum{elemento => elemento.valor(self)}
	
	method existeElementoDe(unaCategoria) = galeria.any{elemento => elemento.categoria() == unaCategoria}
	
	method categorias() = galeria.map{elemento => elemento.categoria()}.asSet()
	
	method todosValiosos() = galeria.all{elemento => elemento.valor(self) > 600}
	
	method comprarMicrofono(unMicrofono) { microfono = unMicrofono}
	
	method getMicrofono() = microfono
	
	method guardarEnEstuche(unEstuche) {estuche = unEstuche}
	
	method getEstuche() = estuche
}


//Objetos coleccionables (no es necesario modificarlos) 
object soldadoDePlomo {
	
	method esFragil(col) = true
	method valor(col) = 500	
	method categoria() = juguete
}

object cassetteCantaninio {
	
	method esFragil(col) = false
	method valor(col) = 900	
	method categoria() = musica
}

object muniecoHeman {
	
	method esFragil(col) = false
	method valor(col) = 800	
	method categoria() = juguete
}

object discoViniloLaBalsa {
	
	method esFragil(col) = true
	method valor(col) = 1500	
	method categoria() = musica
}

//Objetos para usar como categoria (no es necesario modificarlos)
object juguete {
	
}

object musica {
	
}

object noTiene{		//OBJETO AGREGADO PARA PODER DAR UNA CATEGORIA NULA A NINGUNO
	
}

// PUNTO 2: POLIMORFISMO. 
object guitarraElectrica {
	
   	method esFragil(col) = col.getEstuche().esFragil(col)
   	
	method valor(col) = 10000 + col.getMicrofono().valor(col)
	
	method categoria() = musica
}

object gibson{
	
	method esFragil(col) = false
	method valor(col) = 1000
	method categoria() = musica
}

object diMarzio{
	
	method esFragil(col) = false
	method valor(col) = 800
	method categoria() = musica

}

object flexible{
	
	method esFragil(col) = true
	method valor(col) = 0
	method categoria() = noTiene
}

object rigido{
	
	method esFragil(col) = false
	method valor(col) = 0
	method categoria() = noTiene	
}

object ninguno{							//OBJETO AGREGADO PARA PODER DAR UN ELEMENTO NULO A "ESTUCHE" Y A "MICROFONO"

	method valor(col) = 0
	method esFragil(col) = false
	method categoria() = noTiene
}