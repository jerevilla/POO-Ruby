require '../model/persona'

class Persona_Factory
	
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
end