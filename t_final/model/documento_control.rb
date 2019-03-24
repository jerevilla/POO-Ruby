require '../model/persona.rb'
require '../model/habitacion.rb'
require '../model/detalle_reserva.rb'

class Documento_Control
	attr_accessor :codigo, :fecha, :hora, :cliente, :empleado
	def initialize(codigo, fecha, hora, cliente, empleado)
		@codigo, @fecha, @hora, @cliente, @empleado = codigo, fecha, hora, cliente, empleado
	end
end

class Reserva < Documento_Control
	attr_accessor  :fechaEntrada, :fechaSalida, :detalles_reserva

	def initialize(codigo, fecha, hora, cliente, empleado, cant_habitaciones, fechaEntrada, fechaSalida)
		super(codigo, fecha, hora, cliente, empleado)
		@cant_habitaciones, @fechaEntrada, @fechaSalida =  cant_habitaciones, fechaEntrada, fechaSalida
		@detalles_reserva = Array.new
	end
	def crear_detalle(cantidad, habitacion,cliente)
		detalle = Detalle_Reserva.new(cantidad, habitacion)
		detalle.agregar_cliente(cliente)

		agregar_detalle(detalle)
	end

	def calcular_adultos
		cant_adultos = 0
		detalles_reserva.each do |det|
			det.clientes.each do |cliente|
				fec =  Date.parse(cliente.fecha_nacimiento.to_s)
				edad = 2018 - fec.year.to_i
				if edad >= 18
					cant_adultos += 1
				end
			end
		end
		
		return cant_adultos
	end

	def calcular_ninos
		cant_ninos = 0
		detalles_reserva.each do |det|
			det.clientes.each do |cliente|
				fec =  Date.parse(cliente.fecha_nacimiento.to_s)
				edad = 2018 - fec.year.to_i
				if edad < 18
					cant_ninos += 1
				end
			end
		end
		
		return cant_ninos
	end
	def calcular_total
		total = 0 
		detalles_reserva.each do |detalle|
			total += detalle.precio_total
		end
		return total
	end

	def calcular_igv
		calcular_total * IGV
	end

	def agregar_detalle(detalle)
		detalles_reserva.push(detalle)
	end
end

class Checkin < Documento_Control
	attr_accessor :reserva
	def initialize(codigo, fecha, hora, cliente, empleado, reserva)
		super(codigo, fecha, hora, cliente, empleado)
		@reserva =  reserva
	end 

	def reporte
		puts "================CHECKIN================"
		puts "Cliente: 		#{cliente.nombre} #{cliente.apellido}"
		puts "DNI: 			#{cliente.dni}"
		puts "Fecha: 			#{fecha}"
		puts "========================================"
		reserva.reporte
	end

end

class Checkout < Documento_Control
	attr_accessor :reserva
	def initialize(codigo, fecha, hora, cliente, empleado, reserva)
		super(codigo, fecha, hora, cliente, empleado)
		@reserva =  reserva
	end 
	def reporte
		puts "================CHECKOUT================"
		puts "Cliente: 		#{cliente.nombre} #{cliente.apellido}"
		puts "DNI: 			#{cliente.dni}"
		puts "Fecha: 			#{fecha}"
		puts "========================================"
		reserva.reporte
	end	
end

#(codigo, fecha, hora, cliente, empleado, cant_habitaciones, fechaEntrada, fechaSalida)
#cliente = Persona_Natural.new("P001", "Juan", "Mendoza", "43049545", "13/11/1985")
#cliente2 = Persona_Natural.new("P002", "Valeria", "Mendoza", "03049545", "13/11/2013")
#def initialize(codigo, nombre, apellido, dni, cargo)
#empleado = Empleado.new("E001", "Jorge", "Arevalo", "14231222", "Recepcionista")
#habitacion = Habitacion.new("HA001", "201", "Simple", 0, 0)
#habitacion2 = Habitacion.new("HA002", "105", "Doble", 0, 0)
#reserva = Documento_Control_Factory.
#reserva = Reserva.new("R001", "25/11/2018","8:00",cliente, empleado, 2,"03/12/2018", "05/12/2018")
#reserva.crear_detalle(2, habitacion, cliente)
#reserva.crear_detalle(2, habitacion2, cliente2)

#checkin = Checkin.new("R001","10:00",cliente, empleado,"03/12/2018", reserva)
#checkin.reporte

#checkout = Checkout.new("R001","03/12/2018","19:00",cliente, empleado, reserva)
#checkout.reporte

#reserva.reporte