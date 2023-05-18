import mundo.*

class VendedorFijo {
	var property ciudad = #{}
	const property certificaciones = []
	
	
	method puedeTrabajar(lugar) = ciudad == lugar
	
	method esVersatil(){
		return 	certificaciones.any({cer => cer.esProducto()}) and 
				!certificaciones.any({cer => cer.esProducto()}) and
				certificaciones.size() >= 3  }
	
	method esFirme(){	return certificaciones.sum({cer => cer.puntaje()}) >= 30	}
	
	method esInfluyente(){return false}
	
	method agregarCertificacion(certificado){
		certificaciones.add(certificado)
	}
}

class Viajante {
	var property prov = #{}
	const property certificaciones = []
	
	method puedeTrabajar(lugar){	return prov.ciudades().contains(lugar)	}
	
	method esVersatil(){
		return 	certificaciones.any({cer => cer.esProducto()}) and 
				!certificaciones.any({cer => cer.esProducto()}) and
				certificaciones.size() >= 3  }
					
	method esFirme(){
		return certificaciones.sum({cer => cer.puntaje()}) >= 30}
	
	method esInfluyente(){	return prov.sum({provincia => provincia.poblacion()}) >= 10000000	}
	
	method agregarCertificacion(certificado){
		certificaciones.add(certificado)
	}
}

class Corresponsal {
	var property sucursalesCiu = #{}
	const property certificaciones = []
	
	method puedeTrabajar(lugar) = sucursalesCiu.provincia().contains(lugar)
	
	method esVersatil(){
		return 	certificaciones.any({cer => cer.esProducto()}) and 
				certificaciones.any({cer => !cer.esProducto()}) and
				certificaciones.size() >= 3  }
	
	method esFirme(){	return certificaciones.sum( {cer => cer.puntaje()} ) >= 30	}
	
	method esInfluyente(){	return sucursalesCiu.size() >= 5 or self.provinciasDeCiudades().size() >= 3	}
	// No estaría muy seguro si la parte de asSet funcionará
	
	method agregarCertificacion(certificado){
		certificaciones.add(certificado)
	}
	
	method provinciasDeCiudades(){
		return sucursalesCiu.map( {lugar=> lugar.provincia()} ).asSet()
	}
}

class Certificaciones {
	var property puntaje
	var property esProducto
}