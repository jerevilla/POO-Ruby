require "../model/habitacion.rb"
require "../model/producto.rb"
require "../model/persona.rb"
require "../model/documento_control.rb"
require "../model/detalle_factura.rb"
require "../model/detalle_boleta.rb"
require "../model/comprobante_pago.rb"
require "../view/comprobante_factory.rb"
require "./documento_control_factory.rb"
require "../view/factory.rb"
require "../controller/reporte.rb"


#Instanciando Personas Naturales
objcliente1 = Factory.crear_persona("Persona_Natural","P001", "Juan", "Mendoza", "43049545", Date.strptime("13-11-1985",'%d-%m-%Y'))
objcliente2 = Factory.crear_persona("Persona_Natural","P002", "Valeria", "Mendoza", "02541254", Date.strptime("13-11-2013",'%d-%m-%Y'))
objcliente3 = Factory.crear_persona("Persona_Natural","P003", "Valeria2", "Mendoza2", "05748411", Date.strptime("13-10-2015",'%d-%m-%Y'))
objcliente4 = Factory.crear_persona("Persona_Natural","P004", "Valeria3", "Mendoza3", "43011254", Date.strptime("25-05-1984",'%d-%m-%Y'))
objcliente5 = Factory.crear_persona("Persona_Natural","P005", "Valeria4", "Mendoza4", "45144585", Date.strptime("13-12-1990",'%d-%m-%Y'))
objcliente6 = Factory.crear_persona("Persona_Natural","P006", "Valeria5", "Mendoza5", "03049545", Date.strptime("05-06-2000",'%d-%m-%Y'))
objcliente7 = Factory.crear_persona("Persona_Natural","P007", "Valeria6", "Mendoza6", "05125474", Date.strptime("15-01-2001",'%d-%m-%Y'))
objcliente8 = Factory.crear_persona("Persona_Natural","P008", "Juan", "Mendoza", "43049545", Date.strptime("13-11-1985",'%d-%m-%Y'))

#Instanciando Personas Juridicas

objper_juridica1 = Factory.crear_persona("Persona_Juridica", "H001","MiEmpresa.SAC_1", "12024154781")
objper_juridica2 = Factory.crear_persona("Persona_Juridica", "H002","MiEmpresa.SAC_2", "18544587546")
objper_juridica3 = Factory.crear_persona("Persona_Juridica", "H003","MiEmpresa.SAC_3", "85475456893")
objper_juridica4 = Factory.crear_persona("Persona_Juridica", "H004","MiEmpresa.SAC_4", "25478145247")
objper_juridica5 = Factory.crear_persona("Persona_Juridica", "H005","MiEmpresa.SAC_5", "91524856545")
objper_juridica6 = Factory.crear_persona("Persona_Juridica", "H006","MiEmpresa.SAC_6", "87874587963")
objper_juridica7 = Factory.crear_persona("Persona_Juridica", "H007","MiEmpresa.SAC_7", "12024154781")

#Instanciando Empleados
objempleado1 = Factory.crear_persona("Empleado","E001", "Jorge1", "Arevalo1", "14231222", "Recepcionista")
objempleado2 = Factory.crear_persona("Empleado","E002", "Jorge2", "Arevalo2", "42544874", "Recepcionista")
objempleado3 = Factory.crear_persona("Empleado","E003", "Jorge3", "Arevalo3", "25458445", "Recepcionista")
objempleado4 = Factory.crear_persona("Empleado","E004", "Jorge4", "Arevalo4", "25685445", "Recepcionista")

#Instanciando Habitaciones
objhabitacion1 = Habitacion.new("HA001", "101", "Suite", 0, 0)
objhabitacion2 = Habitacion.new("HA002", "103", "Suite", 0, 0)
objhabitacion3 = Habitacion.new("HA003", "201", "Doble", 0, 0)
objhabitacion4 = Habitacion.new("HA004", "203", "Doble", 0, 0)
objhabitacion5 = Habitacion.new("HA005", "301", "Triple", 0, 0)
objhabitacion6 = Habitacion.new("HA006", "305", "Triple", 0, 0)
objhabitacion7 = Habitacion.new("HA007", "402", "Simple", 0, 0)
objhabitacion8 = Habitacion.new("HA008", "404", "Simple", 0, 0)

#Instanciando Productos
objproducto1 = Producto.new("PRD001","GASEOSA A", 10.0)
objproducto2 = Producto.new("PRD002","GASEOSA B", 15.0)
objproducto3 = Producto.new("PRD003","CERVEZA A", 20.0)
objproducto4 = Producto.new("PRD004","CERVEZA B", 25.0)
objproducto5 = Producto.new("PRD005","VINO A", 200.0)
objproducto6 = Producto.new("PRD006","VINO B", 250.0)

#Instanciando Reservas
objreserva1 = Factory.crear_documento_control("Reserva","R001", Date.strptime("25-05-2018",'%d-%m-%Y'),"8:00",objcliente1, objempleado1, 2,Date.strptime("26-06-2018",'%d-%m-%Y'), Date.strptime("28-06-2018",'%d-%m-%Y'))
objreserva1.crear_detalle(2, objhabitacion1, objcliente1)
objreserva1.crear_detalle(2, objhabitacion2, objcliente2)
objreserva2 = Factory.crear_documento_control("Reserva","R002",  Date.strptime("20-08-2018",'%d-%m-%Y'),"6:00",objcliente3, objempleado1, 2,Date.strptime("10-09-2018",'%d-%m-%Y'), Date.strptime("15-09-2018",'%d-%m-%Y'))
objreserva2.crear_detalle(2, objhabitacion2, objcliente3)
objreserva2.crear_detalle(2, objhabitacion3, objcliente4)
objreserva3 = Factory.crear_documento_control("Reserva","R003",  Date.strptime("15-12-2018",'%d-%m-%Y'),"5:00",objcliente4, objempleado1, 2,Date.strptime("18-12-2018",'%d-%m-%Y'), Date.strptime("20-12-2018",'%d-%m-%Y'))
objreserva3.crear_detalle(2, objhabitacion4, objcliente3)
objreserva3.crear_detalle(2, objhabitacion5, objcliente4)
objreserva3.crear_detalle(2, objhabitacion1, objcliente3)
objreserva4 = Factory.crear_documento_control("Reserva","R004",  Date.strptime("01-02-2019",'%d-%m-%Y'),"4:00",objcliente5, objempleado1, 2,Date.strptime("03-02-2019",'%d-%m-%Y'), Date.strptime("05-02-2019",'%d-%m-%Y'))
objreserva4.crear_detalle(2, objhabitacion6, objcliente4)

#Instanciando Checkin
objcheckin1 = Factory.crear_documento_control("Checkin","CIN001",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente1, objempleado1, objreserva4)
objcheckin2 = Factory.crear_documento_control("Checkin","CIN002",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente4, objempleado3, objreserva2)
objcheckin3 = Factory.crear_documento_control("Checkin","CIN003",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente2, objempleado4, objreserva3)
objcheckin4 = Factory.crear_documento_control("Checkin","CIN004",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente1, objempleado2, objreserva1)

#Instanciando Checkout
objcheckout1 = Factory.crear_documento_control("Checkout","CHO001",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente1, objempleado1, objreserva4)
objcheckout2 = Factory.crear_documento_control("Checkout","CHO002",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente4, objempleado3, objreserva2)
objcheckout3 = Factory.crear_documento_control("Checkout","CHO003",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente2, objempleado4, objreserva3)
objcheckout4 = Factory.crear_documento_control("Checkout","CHO004",Date.strptime("03-12-2018",'%d-%m-%Y'),"19:00",objcliente1, objempleado2, objreserva1)

#Instanciando Facturas
factura1 = Factory.crear_comprobante("F","F001", objper_juridica1, Date.strptime("03-12-2015",'%d-%m-%Y'),objcheckin1)
factura1.crear_detalle(objproducto1, 2)
factura1.crear_detalle(objproducto2, 2)

factura2 = Factory.crear_comprobante("F","F002", objper_juridica2, Date.strptime("03-11-2018",'%d-%m-%Y'),objcheckin2)
factura2.crear_detalle(objproducto3, 2)
factura2.crear_detalle(objproducto4, 2)

factura3 = Factory.crear_comprobante("F","F003", objper_juridica2, Date.strptime("03-01-2019",'%d-%m-%Y'),objcheckin3)
factura3.crear_detalle(objproducto5, 2)
factura3.crear_detalle(objproducto6, 2)

#Instanciando Boletas
boleta1 = Factory.crear_comprobante("B","B001", objcliente4, Date.strptime("05-12-2018",'%d-%m-%Y'),objcheckin4)
boleta1.crear_detalle(objproducto1, 2)
boleta1.crear_detalle(objproducto2, 2)

boleta2 = Factory.crear_comprobante("B","B002", objcliente2, Date.strptime("03-11-2018",'%d-%m-%Y'),objcheckin3)
boleta2.crear_detalle(objproducto3, 2)
boleta2.crear_detalle(objproducto4, 2)

boleta3 = Factory.crear_comprobante("B","B003", objcliente3, Date.strptime("03-01-2019",'%d-%m-%Y'),objcheckin1)
boleta3.crear_detalle(objproducto5, 2)
boleta3.crear_detalle(objproducto6, 2)




#factura

objReporte = Reporte.new
objReporte.agregar_reserva(objreserva1)
objReporte.agregar_reserva(objreserva2)
objReporte.agregar_reserva(objreserva3)
objReporte.agregar_reserva(objreserva4)

objReporte.agregar_checkin(objcheckin1)
objReporte.agregar_checkin(objcheckin2)
objReporte.agregar_checkin(objcheckin3)
objReporte.agregar_checkin(objcheckin4)

objReporte.agregar_checkout(objcheckout1)
objReporte.agregar_checkout(objcheckout2)
objReporte.agregar_checkout(objcheckout3)
objReporte.agregar_checkout(objcheckout4)

objReporte.agregar_facturas(factura1)
objReporte.agregar_facturas(factura2)
objReporte.agregar_facturas(factura3)


objReporte.agregar_boletas(boleta1)
objReporte.agregar_boletas(boleta2)
objReporte.agregar_boletas(boleta3)

=begin
#Consultar reservas por código
objReporte.consultar_reservas_por_codigo("R004")

#Consultar checkin por codigo
objReporte.consultar_checkin_por_codigo("CIN002")

#Consultar Chekout por codigo
objReporte.consultar_checkout_por_codigo("CHO002")

#Buqueda por codigo F=Factura B=Boleta
objReporte.consultar_pagos_por_codigo("F","F001")
objReporte.consultar_pagos_por_codigo("B","B001")

#Busqueda por rango de fechas
objReporte.buscar_boleta_por_fecha("01-01-2019","03-02-2019")
objReporte.buscar_factura_por_fecha("01-01-2019","03-02-2019")

#Busquedas por DNI / RUC
objReporte.buscar_boleta_por_dni("02541254")
objReporte.buscar_factura_por_ruc("12024154781")
=end
#Busqueda por Reserva
objReporte.consultar_datos_por_reserva("R001")
