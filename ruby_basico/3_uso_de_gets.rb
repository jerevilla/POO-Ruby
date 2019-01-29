#Ingreso de datos por teclado 
puts "Ingrese su nombre: "
nombre = gets.chomp
puts "Nombre ingresado: " + nombre

puts "Ingrese su apellido: "
apellido = gets.chomp
puts "Apellido ingresado: " + apellido

puts "Nombre y apellido: " + nombre + " " + apellido

puts "Ingrese su edad: "
edad = gets.chomp.to_i

edad_futura = edad + 10
puts "En 10 anhos tendras #{edad_futura} anhos"