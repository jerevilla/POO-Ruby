require '../model/persona.rb'
require '../model/comprobante_pago.rb'
require '../model/documento_control'
require '../model/detalle_reserva'
class Factory

	def self.crear_persona(tipo, *args)
		case tipo
			when "Persona_Natural"
				Persona_Natural.new(args[0], args[1], args[2], args[3], args[4])
			when "Persona_Juridica"		
				Persona_Juridica.new(args[0],args[1],args[2])
			when "Empleado"
				Empleado.new(args[0],args[1],args[2],args[3],args[4])
		end			
	end

	def self.crear_comprobante(tipo_comprobante, codigo, persona, fecha, checkin)
		case tipo_comprobante
			when "F"
				Factura.new(codigo, persona, fecha, checkin)
			when "B"		
				Boleta.new(codigo, persona, fecha, checkin)
		end			
	end

	def self.crear_documento_control(tipo_documento, *args)
		case tipo_documento
			when "Reserva"
				reserva = Reserva.new(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7])
			when "Checkin"		
				Checkin.new(args[0],args[1], args[2], args[3], args[4], args[5])
			when "Checkout"
				Checkout.new(args[0],args[1], args[2], args[3], args[4], args[5])
		end			
	end

end