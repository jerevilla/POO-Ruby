require 'date'
class Detalle_Reserva
	attr_accessor :noches, :habitacion, :precio_total, :clientes
	def initialize(noches, habitacion)
	  	@noches, @habitacion = noches, habitacion
	  	@precio_total = calcular_total
	  	@clientes = Array.new
	  	
	end  

	def agregar_cliente(cliente)
		clientes.push(cliente)
	end

	

private
	def calcular_total
		total = (habitacion.obtener_tarifa * noches).round(2)
	end
end
=begin
class Detalle_Factura
	attr_accessor :descripcion, :cantidad, :precio_unitario, :precio_total
	def initialize(descripcion, cantidad, precio_unitario)
		@descripcion, @cantidad, @precio_unitario = descripcion, cantidad, precio_unitario
		@precio_total = calcultar_total
	end

private

	def calcultar_total
		precio_total =  (precio_unitario * cantidad).round(2)
	end
end
=end