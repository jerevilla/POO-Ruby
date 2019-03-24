require '../util/tipoDuplicadoDNI.rb'
require '../model/documento_control.rb'
require '../model/comprobante_pago.rb'
class Reporte
	attr_accessor :personas, :habitaciones, :reservas, :productos, :facturas, :boletas, :checkins, :checkouts

	def initialize()
		@personas 		= Array.new
		@habitaciones 	= Array.new
		@reservas	 	= Array.new
		@productos	 	= Array.new
		@facturas	 	= Array.new
		@boletas 		= Array.new
		@checkins		= Array.new
		@checkouts	 	= Array.new
	end

	def agregar_persona(persona)

	    if persona.instance_of? Persona_Natural
	     documento = persona.dni
	    elsif persona.instance_of? Empleado
	     documento = persona.dni
	    elsif persona.instance_of? Persona_Juridica
	     documento = persona.ruc
	    end
      	
		begin
			raise TipoDuplicadoDNI, ""  if existePersona(documento) == true
			@personas.push(persona)
			rescue => err
				puts err.message
		end
	end

	def agregar_habitacion(habitacion)
		@habitaciones.push(habitacion)
	end

	def agregar_reserva(reserva)
		@reservas.push(reserva)
	end

	def agregar_productos(producto)
		@productos.push(producto)
	end

	def agregar_facturas(factura)
		@facturas.push(factura)
	end

	def agregar_boletas(boleta)
		@boletas.push(boleta)
	end

	def agregar_checkin(x)
		@checkins.push(x)
	end
	def agregar_checkout(x)
		@checkouts.push(x)
	end

	def existePersona(documento)
      existe = false
      	personas.each do |persona|
	      	if persona.instance_of? Persona_Natural
	      		if persona.dni == documento
	      			existe = true
	           		break
	      		end
	      	elsif persona.instance_of? Empleado
	      		if persona.dni == documento
	      			existe = true
	           		break
	      		end
	      	else
	      		if persona.ruc == documento
	      			existe = true
	           		break
	      		end
	      	end
      	end
=begin
      for x in @personas
          if x.dni == dni
            existe = true
            break
          end
      end
=end
      return existe
  end



	def consultar_reservas_por_codigo(codigo)
		@reservas.each do |reserva|
			if reserva.codigo == codigo
				total = reserva.calcular_total.round(2)
				igv = reserva.calcular_igv.round(2)
				det = reserva.detalles_reserva.last
				puts "===================================================RESERVA============================================================"
				puts "Cliente: 		#{reserva.cliente.nombre} #{reserva.cliente.apellido}\t\t\t\t\t\tDNI: 			#{reserva.cliente.dni}"
				puts "Fecha: 			#{reserva.fecha}\t\t\t\t\t\t\tAdultos: 		#{reserva.calcular_adultos}\t\t\t\tNiños: 	#{reserva.calcular_ninos}"
				puts "===================================================DETALLE RESERVA===================================================="
				reserva.detalles_reserva.each do |detalle|
					print "Habitacion: 	#{detalle.habitacion.num_habitacion}".ljust(30)
					print "Noches: 	#{detalle.noches}".ljust(30)
					print "Precio Habitación: #{detalle.habitacion.tarifa}".ljust(30)
					print "Total: 			#{detalle.precio_total}	\n"
				end
				puts "======================================================================================================================"
				puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
				puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
				puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
				puts "======================================================================================================================"
			end
		end
	end
	
	def consultar_checkin_por_codigo(codigo)
		checkins.each do |checkin|
			if checkin.codigo == codigo
				puts "================CHECKIN================"
				puts "Cliente: 		#{checkin.cliente.nombre} #{checkin.cliente.apellido}"
				puts "DNI: 			#{checkin.cliente.dni}"
				puts "Fecha: 			#{checkin.fecha}"
				puts "========================================"
				consultar_reservas_por_codigo(checkin.reserva.codigo)
			end
		end
		
	end

	def consultar_checkout_por_codigo(codigo)
		checkouts.each do |checkout|
			if checkout.codigo == codigo
				puts "================CHECKIN================"
				puts "Cliente: 		#{checkout.cliente.nombre} #{checkout.cliente.apellido}"
				puts "DNI: 			#{checkout.cliente.dni}"
				puts "Fecha: 			#{checkout.fecha}"
				puts "========================================"
				consultar_reservas_por_codigo(checkout.reserva.codigo)
			end
		end
		
	end

	def consultar_pagos_por_codigo(comprobante, codigo)
		case comprobante
		when "F"
			facturas.each do |factura|
				if factura.codigo == codigo
					total = factura.calcular_total.round(2)
					igv = factura.calcular_igv.round(2)
					puts "===================================================FACTURA============================================================"
					puts "Razón Social: 	#{factura.persona.razon_social}"
					puts "RUC: 			#{factura.persona.ruc}"
					puts "Fecha: 			#{factura.fecha}"
					puts "===================================================DETALLE FACTURA===================================================="
					factura.detalles_factura.each do |detalle|
						print "Descripcion: #{detalle.producto.nombre}".ljust(30)
						print "Cantidad: 	#{detalle.cantidad}".ljust(30)
						print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
						print "Total: 			#{detalle.precio_total}	\n"
					end
					puts "======================================================================================================================"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
					puts "======================================================================================================================"
				end
			end
		when "B"
			boletas.each do |boleta|
				if boleta.codigo == codigo
					total = boleta.calcular_total.round(2)
					igv = boleta.calcular_igv.round(2)
					puts "===================================================BOLETA============================================================"
					puts "Huesped: 		#{boleta.persona.nombre} #{boleta.persona.apellido}"
					puts "DNI: 			#{boleta.persona.dni}"
					puts "Fecha: 			#{boleta.fecha}"
					puts "===================================================DETALLE BOLETA===================================================="
					boleta.detalles_boleta.each do |detalle|
						print "Descripcion: #{detalle.producto.nombre}".ljust(30)
						print "Cantidad: 	#{detalle.cantidad}".ljust(30)
						print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
						print "Total: 			#{detalle.precio_total}	\n"
					end
					puts "======================================================================================================================"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
					puts "======================================================================================================================"
				end
			end
		end
		
	end

	def buscar_boleta_por_fecha(fec1, fec2)
		cont = 0
		puts "-------------------"
		puts "Busqueda por fecha"
		puts "-------------------"
		boletas.each_with_index do |boleta, pos| 
			pos += 1
			if boleta.fecha > Date.strptime(fec1,'%d-%m-%Y') and 
			   boleta.fecha < Date.strptime(fec2,'%d-%m-%Y')
			   	cont += 1
			   		total = boleta.calcular_total.round(2)
					igv = boleta.calcular_igv.round(2)
					puts "===================================================BOLETA #{pos}============================================================"
					puts "Huesped: 		#{boleta.persona.nombre} #{boleta.persona.apellido}"
					puts "DNI: 			#{boleta.persona.dni}"
					puts "Fecha: 			#{boleta.fecha}"
					puts "===================================================DETALLE BOLETA===================================================="
					boleta.detalles_boleta.each do |detalle|
						print "Descripcion: #{detalle.producto.nombre}".ljust(30)
						print "Cantidad: 	#{detalle.cantidad}".ljust(30)
						print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
						print "Total: 			#{detalle.precio_total}	\n"
					end
					puts "======================================================================================================================"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
					puts "======================================================================================================================\n\n\n"
			 end
		end  
	end

	def buscar_factura_por_fecha(fec1, fec2)
	
		puts "-------------------"
		puts "Busqueda por fecha"
		puts "-------------------"
		facturas.each_with_index do |factura, pos| 
			pos += 1
			if factura.fecha > Date.strptime(fec1,'%d-%m-%Y') and 
			   factura.fecha < Date.strptime(fec2,'%d-%m-%Y')
			   		total = factura.calcular_total.round(2)
					igv = factura.calcular_igv.round(2)
					puts "===================================================FACTURA #{pos}============================================================"
					puts "Razón Social: 	#{factura.persona.razon_social}"
					puts "RUC: 			#{factura.persona.ruc}"
					puts "Fecha: 			#{factura.fecha}"
					puts "===================================================DETALLE FACTURA===================================================="
					factura.detalles_factura.each do |detalle|
						print "Descripcion: #{detalle.producto.nombre}".ljust(30)
						print "Cantidad: 	#{detalle.cantidad}".ljust(30)
						print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
						print "Total: 			#{detalle.precio_total}	\n"
					end
					puts "======================================================================================================================"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
					puts "======================================================================================================================\n\n\n"
			 end
		end  
	end

	def buscar_boleta_por_dni(dni)
		cont = 0
		puts "-------------------"
		puts "Busqueda por DNI"
		puts "-------------------"
		boletas.each_with_index do |boleta, pos| 
			pos += 1
			if boleta.persona.dni.to_s == dni
			   	cont += 1
			   		total = boleta.calcular_total.round(2)
					igv = boleta.calcular_igv.round(2)
					puts "===================================================BOLETA #{pos}============================================================"
					puts "Huesped: 		#{boleta.persona.nombre} #{boleta.persona.apellido}"
					puts "DNI: 			#{boleta.persona.dni}"
					puts "Fecha: 			#{boleta.fecha}"
					puts "===================================================DETALLE BOLETA===================================================="
					boleta.detalles_boleta.each do |detalle|
						print "Descripcion: #{detalle.producto.nombre}".ljust(30)
						print "Cantidad: 	#{detalle.cantidad}".ljust(30)
						print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
						print "Total: 			#{detalle.precio_total}	\n"
					end
					puts "======================================================================================================================"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
					puts "======================================================================================================================\n\n\n"
			 end
		end  
	end

	def buscar_factura_por_ruc(ruc)
	
		puts "-------------------"
		puts "Busqueda por RUC"
		puts "-------------------"
		facturas.each_with_index do |factura, pos| 
			pos += 1
			if factura.persona.ruc == ruc
			   		total = factura.calcular_total.round(2)
					igv = factura.calcular_igv.round(2)
					puts "===================================================FACTURA #{pos}============================================================"
					puts "Razón Social: 	#{factura.persona.razon_social}"
					puts "RUC: 			#{factura.persona.ruc}"
					puts "Fecha: 			#{factura.fecha}"
					puts "===================================================DETALLE FACTURA===================================================="
					factura.detalles_factura.each do |detalle|
						print "Descripcion: #{detalle.producto.nombre}".ljust(30)
						print "Cantidad: 	#{detalle.cantidad}".ljust(30)
						print "Precio Unitario: #{detalle.producto.precio}".ljust(30)
						print "Total: 			#{detalle.precio_total}	\n"
					end
					puts "======================================================================================================================"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total: 			#{total}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t IGV: 				#{igv}"
					puts "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Total a pagar 		#{total + igv}"
					puts "======================================================================================================================\n\n\n"
			 end
		end  
	end

	def consultar_datos_por_reserva(codigo)
		puts "--------------------"
		puts "Busqueda por Reserva"
		puts "--------------------"
		checkins.each do |checkin|
			checkouts.each do |checkout|
				if checkin.reserva.codigo == codigo && checkout.reserva.codigo == codigo
					puts "================CHECKIN================ \t\t\t\t\t================CHECKOUT================"
					puts "Cliente: 		#{checkin.cliente.nombre} #{checkin.cliente.apellido} \t\t\t\t\t\t\t\tCliente: 		#{checkout.cliente.nombre} #{checkout.cliente.apellido}"
					puts "DNI: 			#{checkin.cliente.dni} \t\t\t\t\t\t\t\t\tDNI: 			#{checkout.cliente.dni}"
					puts "Fecha: 			#{checkin.fecha} \t\t\t\t\t\t\t\t\tFecha: 			#{checkout.fecha}"
					puts "======================================== \t\t\t\t\t========================================"
				end
			end
		end
		puts
		reservas.each do |reserva|
			if reserva.codigo == codigo
				consultar_reservas_por_codigo(codigo)
			end
		end
		puts
		
		facturas.each do |factura|
			if factura.checkin.reserva.codigo == codigo
				puts "--------FACTURA - DETALLE----"
				consultar_pagos_por_codigo("F", boleta.codigo)
			end
		end

		boletas.each do |boleta|
			if boleta.checkin.reserva.codigo == codigo
				puts "--------BOLETA - DETALLE----"
				puts
				consultar_pagos_por_codigo("B", boleta.codigo)
			end
		end

	end

end

