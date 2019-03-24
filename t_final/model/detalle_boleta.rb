class Detalle_Boleta
	attr_accessor :producto, :cantidad, :precio_total
	def initialize(producto, cantidad)
		@producto, @cantidad = producto, cantidad
		@precio_total = calcultar_total
	end

private

	def calcultar_total
		precio_total =  (producto.precio * cantidad).round(2)
	end
end