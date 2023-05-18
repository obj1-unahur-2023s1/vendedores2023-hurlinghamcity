import vendedores.*
import mundo.*

class Centro {
	const property ciudad
	var property vendedores = []
	
	method intentarAgregarVendedor(vendedor){
		if (!vendedores.contains(vendedor))	{	vendedores.add(vendedor)	}
		else self.error("Este vendedor ya está en la lista")
	}
	
	method vendedorEstrella(){	return vendedores.max( {vendedor => vendedor.certificacionPuntajeTotal()} )	}
	
	method puedeCubrir(unaCiudad){	return vendedores.any( {vendedor => vendedor.puedeTrabajar(unaCiudad)} ) }
	
	method vendedoresGenericos(){	return vendedores.filter( {vendedor => !vendedor.esGenerico()} )	}
	
	method esRobusto() = self.vendedoresFirmes().size() >=3
	
	method vendedoresFirmes(){	return vendedores.filter({vendedor => vendedor.esFirme()})	}

	method repartirCerticacion(certificado){
		vendedores.forEach({vendedor => vendedor.agregarCertificacion(certificado)})	}
	
	method tieneAfinidadConVendedor(vendedor) = vendedor.esVersatil() and vendedor.tieneAfinidadConCentro(self)
}
