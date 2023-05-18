class VendedorFijo {
	const property ciudad
	const property certificaciones = []
	
	
	method puedeTrabajar(lugar) = ciudad == lugar
	
	method esVersatil(){
		return certificaciones.contains("productos") and !certificaciones.contains("productos") and certificaciones.size() >= 3  }
	
	method esFirme(){	return certificaciones.sum({cer => cer.puntaje()}) >= 30	}
	
	method esInfluyente(){return false}
}

class Viajante {
	const property prov = []
	const property certificaciones = []
	
	method puedeTrabajar(lugar){	return prov.ciudades().contains(lugar)	}
	
	method esVersatil(){
		return certificaciones.contains("productos") and !certificaciones.contains("productos") and certificaciones.size() >= 3 }
	
	method esFirme(){
		return certificaciones.sum({cer => cer.puntaje()}) >= 30}
	
	method esInfluyente(){	return prov.sum({provincia => provincia.poblacion()}) >= 10000000	}
}

class Corresponsal {
	const property ciudad = []
	const property certificaciones = []
	
	method puedeTrabajar(lugar){	return ciudad.contains(lugar)	}
	
	method esVersatil(){
		return certificaciones.contains("productos") and !certificaciones.contains("productos") and certificaciones.size() >= 3 }
	
	method esFirme(){	return certificaciones.sum({cer => cer.puntaje()}) >= 30	}
	
	method esInfluyente(){	return ciudad.size() >= 5 or ciudad.asSet( {lugar=> lugar.provincia()} ) >= 3	}
	// No estaría muy seguro si la parte de asSet funcionará
}

class Certificaciones {
	const property puntaje
}

class Ciudad {
	const property provincia
}

class Provincia {
	const property poblacion
	const property ciudades = []
	
}