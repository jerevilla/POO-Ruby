def saludo(nombre = "amigo", edad = 18)
	puts "Hola " + nombre  + ". Tu edad es " + edad.to_s
end

puts "Primera llamada al metodo saludo"
saludo("Jairo",34)

puts "\nSegunda llamada al metodo sin argumentos"
saludo