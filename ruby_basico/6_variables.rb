#tipos de variables / constantes
puts "Estoy en el programa principal o main"
#Constante: su valor no cambia durante la ejecucion del program
IGV = 0.18
$resultado = "Precio final es "

def calcular_precio(precio_bruto)
	$saludo = "Hola" #saludo: variable global
	impuesto = precio_bruto * IGV #impuesto: variable local
	final = precio_bruto + impuesto #final: varibel local
	$resultado += final.to_s
end

puts calcular_precio(100)
#puts final		Esto genera error, pues final es variable local del metodo calcular_precio
puts $saludo