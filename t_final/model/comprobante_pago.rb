require '../model/detalle_factura.rb'
require '../util/constantes.rb'
require '../model/persona.rb'
require '../model/detalle_boleta.rb'
require '../model/producto.rb'

class Comprobante_Pago
	attr_accessor :codigo, :persona, :fecha, :checkin
	def initialize(codigo, persona, fecha, checkin)
		@codigo, @persona, @fecha, @checkin = codigo, persona, fecha, checkin
	end
	def crear_detalle(producto, cantidad)
	end
end

class Factura < Comprobante_Pago
	attr_accessor  :codigo, :persona_juridica, :fecha, :checkin, :detalles_factura
	def initialize(codigo, persona_juridica, fecha, checkin)
		super(codigo, persona_juridica, fecha, checkin)
		@detalles_factura = Array.new
	end

	def crear_detalle(producto, cantidad)
		detalle = Detalle_Factura.new(producto, cantidad)
		agregar_detalle(detalle)
	end

	def calcular_total
		total = 0 
		detalles_factura.each do |detalle|
			total += detalle.precio_total
		end
		return total
	end

	def calcular_igv
		calcular_total * IGV
	end

	def agregar_detalle(detalle)
		detalles_factura.push(detalle)
	end

end

class Boleta < Comprobante_Pago
	attr_accessor :codigo, :persona, :fecha, :checkin, :detalles_boleta
	def initialize(codigo, persona, fecha, checkin)
		super(codigo, persona, fecha, checkin)
		@detalles_boleta = Array.new
	end

	def crear_detalle(producto, cantidad)
		detalle = Detalle_Boleta.new(producto, cantidad)
		agregar_detalle(detalle)
	end

	def reporte
		total = calcular_total.round(2)
		igv = calcular_igv.round(2)
		puts "===================================================BOLETA============================================================"
		puts "Huesped: 		#{huesped.nombre} #{huesped.apellido}"
		puts "DNI: 			#{huesped.dni}"
		puts "Fecha: 			#{fecha}"
		puts "===================================================DETALLE BOLETA===================================================="
		detalles_boleta.each do |detalle|
			print "Descripcion: #{detalle.producto.nombre}".ljust(30)
			print "Cantidad: 	#{detalle.cantidad}".ljust(30)
			print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
			print "Total: 			#{detalle.precio_total}	\n"
		end
		puts "======================================================================================================================"
		puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
		puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
		puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
		puts "======================================================================================================================"
	end

	def calcular_total
		total = 0 
		detalles_boleta.each do |detalle|
			total += detalle.precio_total
		end
		return total
	end

	def calcular_igv
		calcular_total * IGV
	end

	def agregar_detalle(detalle)
		detalles_boleta.push(detalle)
	end
end

=begin
persona_juridica = Persona_Juridica.new("H001","MiEmpresa.SAC", "12024154781")
factura = Factura.new(persona_juridica, "03/12/2015")
#detalle = Detalle_Factura.new("Gaseosa", 2, 10.0)
#detalle2 = Detalle_Factura.new("Cerveza", 1, 20.0)
producto1 = Producto.new("P001", "Gaseosa", 10.0)
producto2 = Producto.new("P002", "Cerveza", 20.0)

factura.crear_detalle(producto1, 2)
factura.crear_detalle(producto2, 2)

#factura.reporte

puts
puts
huesped = Persona_Natural.new("H001","Juan", "Mendoza", "43049545", "13/11/1985")
boleta = Boleta.new(huesped, "03/12/2015")
#detalle = Detalle_BOLETA.new("Gaseosa", 2, 10.0)
#detalle2 = Detalle_BOLETA.new("Cerveza", 1, 20.0)

boleta.crear_detalle(producto1, 1)
boleta.crear_detalle(producto2, 2)

boleta.reporte
=end