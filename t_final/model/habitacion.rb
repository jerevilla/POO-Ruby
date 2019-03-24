require '../util/constantes.rb'
class Habitacion
	attr_accessor :cod_habitacion, :num_habitacion, :tipo_habitacion, :estado_disp, :estado_func, :tarifa

	def initialize(cod_habitacion, num_habitacion, tipo_habitacion, estado_func, estado_disp)
		@cod_habitacion, @num_habitacion, @tipo_habitacion, @tarifa, @estado_func, @estado_disp = cod_habitacion, num_habitacion, tipo_habitacion, tarifa, estado_func, estado_disp
		@tarifa = obtener_tarifa
	end


	def obtener_tarifa
		if tipo_habitacion == SIMPLE
			return 180.0
		elsif tipo_habitacion == DOBLE
			return 300.0
		elsif tipo_habitacion == TRIPLE
			return 450.0
		elsif tipo_habitacion == SUITE	
			return 800.0	
		else
			"No existe Tipo de Habitación ingresada"
		end
	end


	def obtener_estado_disponibilidad
		if estado_disp == CERO
			return LIBRE
		elsif estado_disp == UNO
			return OCUPADO
		else
			return ""
		end
	end

	def obtener_estado_funcionamiento
		if estado_func == CERO
			return OPERATIVO
		elsif estado_func == UNO
			return INOPERATIVO
		else
			return ""
		end
	end

	def cambiar_disponibilidad(disponibilidad)
		estado_disp = disponibilidad
		return 
	end

end

=begin
objHabitacion = Habitacion.new("0001", "201", "Simple", 0, 0)
puts "************************HABITACIONES************************"
puts "Tipo\tNumero\tTarifa\tDisponibilidad\tFuncionamiento"
puts "#{objHabitacion.tipo_habitacion}\t#{objHabitacion.num_habitacion}\t\t#{objHabitacion.tarifa}\t#{objHabitacion.obtenerEstadoDisponibilidad}\t\t\t#{objHabitacion.obtenerEstadoFuncionamiento}"
=end