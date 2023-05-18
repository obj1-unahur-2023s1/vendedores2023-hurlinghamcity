import mundo.*
import centro.*

class Vendedor {
	const property certificaciones = []
	var property ciudad = #{}
	
	method puedeTrabajar(lugar) = ciudad == lugar
	
	method esVersatil(){
		return 	certificaciones.any({cer => cer.esProducto()}) and 
				!certificaciones.any({cer => cer.esProducto()}) and
				certificaciones.size() >= 3  }
				
	method esFirme(){	return certificaciones.sum({cer => cer.puntaje()}) >= 30	}
	
	method agregarCertificacion(certificado){	certificaciones.add(certificado)	}
	
	method certificacionPuntajeTotal(){	return certificaciones.sum( {c => c.puntaje()} )	}
	
	method esGenerico(){	return certificaciones.any( {c => !c.esProducto()} )	}
	
	method tieneAfinidadConCentro(centro) = self.puedeTrabajar(centro.ciudad())
	
	method cantCertificacionesProducto() = certificaciones.count( {c=>c.esProducto()} )
}

class VendedorFijo inherits Vendedor{
	const property esPersona = true
	
	method esInfluyente(){return false}
	
	method cantCertificacionesProducto() = certificaciones.count( {c => c.esProducto()} )
}

class VendedorViajante inherits Vendedor {
	var property prov = #{}
	const property esPersona = true
	
	override method puedeTrabajar(ciudad) = prov.any( {p => p.ciudades() == ciudad} )
	
	method esInfluyente(){	return prov.sum({provincia => provincia.poblacion()}) >= 10000000	}
}

class Corresponsal inherits Vendedor {
	const property esPersona = false
	var property sucursalesCiu = #{}

	override method puedeTrabajar(lugar) = sucursalesCiu.contains(lugar)
	
	method esInfluyente(){	return sucursalesCiu.size() >= 5 or self.provinciasDeLasCiudades().size() >= 3	}
	
	method provinciasDeLasCiudades(){	return sucursalesCiu.map( {lugar=> lugar.provincia()} ).asSet()	}
	
	override method tieneAfinidadConCentro(centro) {
		return 	self.puedeTrabajar(centro.ciudad()) and
				sucursalesCiu.any({c => !centro.puedeCubrir(c)})	
	}
}

class Certificaciones {
	var property puntaje
	var property esProducto
}