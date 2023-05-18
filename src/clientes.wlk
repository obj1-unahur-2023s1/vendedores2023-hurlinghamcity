class Cliente {
	
	method puedeSerAtendido(vendedor)
}

class ClienteInseguro inherits Cliente {
	
	override method puedeSerAtendido(vendedor) = vendedor.esVersatil() and vendedor.esFirme()
}

class ClienteDetallista inherits Cliente {
	
	override method puedeSerAtendido(vendedor) = vendedor.cantCertificacionesProducto() >= 3
}

class ClienteHumanista inherits Cliente {
	
	override method puedeSerAtendido(vendedor) = vendedor.esPersona()
}