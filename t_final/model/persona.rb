require '../util/tipoDuplicadoDNI.rb'
class Persona
	attr_accessor :codigo
	def initialize(codigo)
		@codigo  = codigo
	end
end

class Persona_Natural < Persona
	attr_accessor :nombre, :apellido, :dni, :fecha_nacimiento
	def initialize(codigo, nombre, apellido, dni, fecha_nacimiento)
		super(codigo)
	
		@nombre, @apellido, @dni, @fecha_nacimiento = nombre, apellido, dni, fecha_nacimiento
	end
end
class Persona_Juridica < Persona
	attr_accessor :razon_social, :ruc
	def initialize(codigo, razon_social, ruc)
		super(codigo)
		@razon_social, @ruc = razon_social, ruc
	end
end

class Empleado < Persona
	attr_accessor :nombre, :apellido, :dni, :cargo
	def initialize(codigo, nombre, apellido, dni, cargo)
		super(codigo)
		@nombre, @apellido, @dni, @cargo = nombre, apellido, dni, cargo
	end
end