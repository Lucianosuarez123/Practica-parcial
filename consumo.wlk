class Consumo {

	const property fechaRealizado = new Date()

	method consumidoEntre(min, max) = fechaRealizado.between(min, max)

	method cubiertoPorLlamadas(pack) = false

	method cubiertoPorInternet(pack) = false

}

class ConsumoInternet inherits Consumo {

	const property cantidadMB

	method cantidadMinutos() = 0

	method costo() = cantidadMB * pdepfoni.costoMB()

	override method cubiertoPorInternet(pack) = pack.puedeGastarMB(cantidadMB)

	method cantidad() = cantidadMB

}

class ConsumoLlamada inherits Consumo {

	const property segundos

	method cantidadMB() = 0

	method cantidadMinutos() = (segundos / 60).roundUp()

	method costo() = pdepfoni.precioFijoLlamadas() + (self.cantidadMinutos() - 2) * pdepfoni.costoMinuto()

	override method cubiertoPorLlamadas(pack) = pack.puedeGastarMinutos(self.cantidadMinutos())

	method cantidad() = self.cantidadMinutos()

}

object pdepfoni {

	var property costoMB = 0.1
	var property costoMinuto = 1.5
	var property precioFijoLlamadas = 5

}