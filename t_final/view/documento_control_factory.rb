require '../model/documento_control'
require '../model/persona'
require '../model/detalle_reserva'

class Documento_Control_Factory

	def self.crear_documento_control(tipo_documento, *args)
		case tipo_documento
			when "Reserva"
				reserva = Reserva.new(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7])
			when "Checkin"		
				Checkin.new(args[0])
			when "Chekout"
				Chekout.new(args[0])
		end			
	end
end