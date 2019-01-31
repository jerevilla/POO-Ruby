=begin 
	Operadores logicos:
	&&	and
	||	or
	!	not
=end

puts "Numero aleatorio"
numero1 = rand(1..10)
puts numero1

#if simple
if numero1 == 1
	puts "El numero es 1"
	puts "hola"
end
puts 
puts
#if else
if numero1 <= 3
	puts "El numero es menor o igual a 3"
	puts "Hola"
elsif numero1 == 4 || numero1 == 5
	puts "El numero es igual a 4 o 5"
else
	puts "El numero es mayor a 5"	
end
puts

#if en una sola linea
if numero1 <= 5 then puts "El numero es menor a 5" end
puts 
puts "El numero es mayor a 5" if numero1 > 5