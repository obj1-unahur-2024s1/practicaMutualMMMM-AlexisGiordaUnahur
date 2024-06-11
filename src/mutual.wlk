import socios.*

class Viaje{
	var property idiomas = []
	var implicaEsfuerzo
	var sirveParaBroncearse
	var diasQueDura
	
	method implicaEsfuerzo()=implicaEsfuerzo
	method sirveParaBroncearse()=sirveParaBroncearse
	method diasQueDura()=diasQueDura
	method esInteresante()=idiomas.size()>1
	method esRecomendadaPara(unSocio)= self.esInteresante() and unSocio.leAtrae(self) and not unSocio.actividades().contains(self)                             
}

class ViajePlaya inherits Viaje{
	var largoPlaya
	
	override method implicaEsfuerzo()= largoPlaya>1200
	override method sirveParaBroncearse()=true
	override method diasQueDura()=largoPlaya/500
}

class ExcursionCiudad inherits Viaje{
	var cantidadAtracciones
	
	override method implicaEsfuerzo()= cantidadAtracciones.between(5,8)
	override method sirveParaBroncearse()=false
	override method diasQueDura()=cantidadAtracciones/2
	override method esInteresante()= super() or cantidadAtracciones==5
}

class ExcursionCiudadTropical inherits ExcursionCiudad{
	override method sirveParaBroncearse()=true
	override method diasQueDura()= super()+1
}

class SalidaTrekking inherits Viaje{
	var kms 
	var diasDeSol
	
	override method implicaEsfuerzo()= kms>80
	override method sirveParaBroncearse()= diasDeSol>200 or (diasDeSol.between(100,200) and kms>120)
	override method diasQueDura()= kms/50
	override method esInteresante()= super() and diasDeSol>140
}

class ClaseDeGimnasia{
	method idiomas()=["español"]
	method implicaEsfuerzo()= true
	method sirveParaBroncearse()= false
	method diasQueDura()= 1
	method esRecomendadaPara(unSocio)= unSocio.edad().between(20,30)
}

class TallerLiterario{
	var property libros = []
	
	method idiomas()= libros.filter({l=>l.idioma()})
	method implicaEsfuerzo()= libros.any({l=>l.paginas()>500}) or (libros.size()>0 and libros.filter({l=>l.autor()}).size()==1)
	method sirveParaBroncearse()= false
	method diasQueDura()= libros.size() + 1
	method esRecomendadaPara(unSocio)= unSocio.idiomasQueHabla().size()>1
}

class Libro{
	const property idioma
	const property paginas
	const property autor
}







