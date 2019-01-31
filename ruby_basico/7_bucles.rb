#Bucles
#while end
puts "Imprime los pares a partir de 2 hasta 10, con while"
i = 0
while i < 10	
	i += 2
	puts i
end
puts "Fin del bucle while\n\n"

#until end
puts "Imprime los pares a partir de 2 hasta 10, con until"
i = 0 
until i >= 10
	i += 2
	puts i
end
puts "Fin del bucle until\n\n"

#do while
puts "Imprime los pares a partir de 2 hasta 10, con do/while"
i = 0 
begin 
	i += 2
	puts i
end until i >= 10
puts "Fin del bucle do/while\n\n"

#for 
puts "Imprime los pares a partir de 2 hasta 10, con for"
for i in 1..5 do 
	puts i * 2
end
puts "Fin del bucle for\n\n"