import mutual.*

class Socio{
	const actividades = []
	var actividadesMax
	var property edad
	var property idiomasQueHabla = []
	
	method actividades() = actividades
	method agregarActividad(unaActividad){
		if(actividades.size()<actividadesMax){
			actividades.add(unaActividad)
		}
		else {
			self.error("actividades maximas alcanzadas")
		}
	 }
	 method esAdoradorDelSol()= actividades.all({a=>a.sirveParaBroncearse()})
	 method actividadesEsforzadas()= actividades.filter({a=>a.implicaEsfuerzo()})
	 method leAtrae(unaActividad) = true
}
//5

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad) = unaActividad.diasQueDura()>=4
}

class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad) = 
		if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse()
		else unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad){
		const idiomasActividad = unaActividad.idiomas().asSet()
		const idiomasSocio = self.idiomasQueHabla().asSet()
		
		return idiomasActividad.intersection(idiomasSocio).size() != 0
	}
}








