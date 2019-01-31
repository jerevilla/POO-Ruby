#Array con diversos tipos de elementos
arreglo_variado = ["Juan", 3, 5.1, [1,2], "cadena mas larga"]

#Array solo con enteros
arreglo_enteros = [1, 2, 3, 4, 5]

#Impresion de Arrays
cadena  = arreglo_variado.to_s
puts cadena
puts
puts "arreglo de enteros = #{arreglo_enteros}"

#uso de each para recorrer un Array
puts "\nresultado de each: "
arreglo_enteros.each do |elemento|
	puts "Elemento: #{elemento}"
	puts "Triple: #{elemento * 3}"
	puts "--"
end

#Uso de for para recorrer un Array 
puts "\nresultado de For: "
for i in arreglo_enteros do 
	puts "Elemento: #{i}"
	puts "Doble: #{i * 2}"
	puts "--"
end

puts "\nPrimer elemento [0]: #{arreglo_enteros[0]}"
puts "\nTercer elemento [2]: #{arreglo_enteros[2]}"
puts "\nElemento [-1]: #{arreglo_enteros[-1]}"
puts "\nElemento final: #{arreglo_enteros.last}"
puts "\nElemento inicial: #{arreglo_enteros.first}"

#metodo pop
entero_retirado = arreglo_enteros.pop
puts "\n\nEntero retirado: #{entero_retirado}"
puts "\n\narreglo_enteros: #{arreglo_enteros}"

#metodo push
arreglo_enteros.push(5)
puts "arreglo_enteros: #{arreglo_enteros}"

#metodo <<
arreglo_enteros << 6 
puts "arreglo_enteros: #{arreglo_enteros}"

#metodo delete_at
arreglo_enteros.delete_at(4)
puts "arreglo_enteros: #{arreglo_enteros}"

#metodo delete
arreglo_enteros.delete(3)
puts "arreglo_enteros: #{arreglo_enteros}"

#metodo unshift 
arreglo_enteros.unshift(5)
puts "arreglo_enteros: #{arreglo_enteros}"

arreglo_enteros.unshift(3)
puts "arreglo_enteros: #{arreglo_enteros}"

puts 
puts
#ordenamiento de Arrays
#metodo sort
arreglo_ordenado = arreglo_enteros.sort
puts "arreglo_enteros: #{arreglo_enteros}"
puts "arreglo_ordenado: #{arreglo_ordenado}"

#metodo sort!
arreglo_enteros.sort!
puts "\narreglo_enteros: #{arreglo_enteros}"