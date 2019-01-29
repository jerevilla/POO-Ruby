=begin
Operadpres para comparación: 
	==	igual que
	!=	diferente a
	<	menor que
	<=	menor o igual que
	> 	mayor que
	>= 	mayor o igual que

	Booleanos:
	true
	false
=end

#comparacion de Strings
puts "Juan" == 'Juan'
puts
puts "Juan" == "juan"
puts
#comparacion numerica
puts 10 == 7 + 3
puts
#comparacion de tipos distintos
puts "10" != 10
puts
#otras comparaciones
puts 5 < 4
puts 5 > 4
puts 3.1 >= 3

puts
#concatenacion de Strings
cadena = "Juan"
cadena2 = cadena + ' Perez'
puts cadena2
puts
#conversion de String a entero
puts "10".to_i + 4
puts
#conversion de entero a String
puts cadena3 = 14.to_s + " personas"
puts
#conversion de entero a float
real = 14.to_f
puts real

