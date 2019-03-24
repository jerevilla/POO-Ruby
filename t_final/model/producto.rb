class Producto
	attr_accessor :codigo, :nombre, :precio 
	def initialize(codigo, nombre, precio)
		@codigo, @nombre, @precio = codigo, nombre, precio
	end
end