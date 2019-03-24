require '../model/persona.rb'
require '../model/comprobante_pago.rb'
class Comprobante_Factory
	def self.crear_comprobante(tipo_comprobante, persona, fecha, producto, cantidad)
		case tipo_comprobante
			when "F"
				factura = Factura.new(persona, fecha)
				factura.crear_detalle(producto, cantidad)
			when "B"		
				boleta = Boleta.new(persona, fecha, detalle)
				boleta.crear_detalle(producto, cantidad)
		end			
	end

	

	
end