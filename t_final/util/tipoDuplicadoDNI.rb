class TipoDuplicadoDNI < StandardError
  def message
      "El DNI ya existe"
    end
end

class ExcepcionDNIDuplicado < StandardError
	
end