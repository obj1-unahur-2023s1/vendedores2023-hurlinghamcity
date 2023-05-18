class Centro {
	const property ciudad
	var property vendedores = []
	
	method intentarAgregarVendedor(vendedor){
		if (!vendedores.contains(vendedor))	{	vendedores.add(vendedor)	}
		else self.error("Este vendedor ya está en la lista")
	}
	
	method vendedorEstrella(){	return vendedores.max( {vendedor => vendedor.certificaciones().puntaje()} )	}
	
	method puedeCubrir(unaCiudad){	return vendedores.any( {vendedor => vendedor.puedeTrabajar(unaCiudad)} ) }
	
	method vendedoresGenericos(){	
		return vendedores.map( {vendedor => !vendedor.certificaciones().esProducto()} )	}
	// no sé si andaría bien
	
	method esRobusto(){	return vendedores.filter({vendedor => vendedor.esFirme()}).size() >=3	}
	
	method repartirCerticacion(certificado){
		vendedores.forEach({vendedor => vendedor.agregarCertificacion(certificado)})	}
	
	
}
