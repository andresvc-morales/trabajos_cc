Algoritmo cajero_automatico
	
	Definir usuario_correcto Como Caracter
	Definir contrasena_correcta Como Caracter
	Definir cantidad_deposito Como Entero
	Definir cantidad_sacar Como Entero
	Definir saldo_inicial Como Real
	Definir contador_historial Como Entero
	Dimension credenciales[2]
	Dimension saldo[1]
	Dimension historial[5]
	
	contador_historial <- 1
    credenciales[1] <- "a" // Usuario correcto
    credenciales[2] <- "a" // Contraseña correcta
	
	intentos <- 3
	continuar_credenciales <- Verdadero
	continuar_menu <- Verdadero
	
	// Confirmar credenciales
	Mientras intentos > 0 Y continuar_credenciales Hacer
		Escribir "== Digite su usuario"
		leer usuario_ingresado
		Escribir "== Digite su contraseña"
		leer contrasena_ingresada
		
		si usuario_ingresado = credenciales[1] Y contrasena_ingresada = credenciales[2]
			continuar_credenciales <- Falso
		SiNo
			si usuario_ingresado = credenciales[1] Y contrasena_ingresada <> credenciales[2]
				intentos = intentos - 1
				si intentos > 0 Entonces
					Escribir "!= Contraseña incorrecta, quedan ", intentos, " intentos"
				SiNo
					Escribir "!= Contraseña incorrecta, no quedan intentos"
					continuar_menu = Falso
				FinSi
			SiNo
				Escribir "!= Usuario incorrecto"
			FinSi
		FinSi
		
	FinMientras
	
	// Menu de opciones 
	Mientras continuar_menu
		Escribir ""
		Imprimir "====== Opciones"
		Imprimir "1. Depositar dinero a la cuenta"
		Imprimir "2. Sacar dinero de la cuenta"
		Imprimir "3. Ver saldo"
		Imprimir "4. Salir"
		Escribir ""
		leer opcion_elegida
		
		Segun  opcion_elegida Hacer
			
			Caso 1: // Depositar
				Escribir ""
				Escribir "Digita la cantidad a depositar"
				leer cantidad_deposito 
				si cantidad_deposito > 5000
					cantidad_deposito <- cantidad_deposito - (cantidad_deposito * 0.5)
					Escribir "Se rebajo un 5% ya que es mayor a 5000 , se deposito : ", cantidad_deposito
					saldo[1] <- cantidad_deposito
					Escribir "Saldo actual : ", saldo[1]
					
					Si contador_historial < 5 Entonces
						historial[contador_historial] <- "Depósito: +" + ConvertirATexto(cantidad_deposito)
						contador_historial <- contador_historial + 1
					FinSi
				SiNo
					saldo[1] <- cantidad_deposito
					Escribir "Se deposito : ", cantidad_deposito
					Escribir "Saldo actual : ", saldo[1]
					
					Si contador_historial < 5 Entonces
						historial[contador_historial] <- "Depósito: +" + ConvertirATexto(cantidad_deposito)
						contador_historial <- contador_historial + 1
					FinSi
					
				FinSi
				
			Caso 2: // Sacar dinero
				Escribir ""
				Escribir "Digita la cantidad a sacar (Solo en múltiplos de 1000): "
				Leer cantidad_sacar
				Si cantidad_sacar > 0 Entonces
					Si cantidad_sacar MOD 1000 = 0 Entonces  
						Si cantidad_sacar <= saldo[1] Entonces  
							saldo[1] <- saldo[1] - cantidad_sacar
							Escribir "Se retiro: ", cantidad_sacar
							Escribir "Saldo actual: ", saldo[1]
							Si contador_historial < 5 Entonces
								historial[contador_historial] <- "Retiro: -" + ConvertirATexto(cantidad_sacar)
								contador_historial <- contador_historial + 1
							FinSi
						Sino
							Escribir "!= No tienes suficientes fondos"
						FinSi
					Sino
						Escribir "!= La cantidad ingresada no es múltiplo de 1000"
					FinSi
				Sino
					Escribir "!= La cantidad debe ser mayor a 0"
				FinSi
				
			Caso 3: // Ver saldo y historial
				Escribir ""
				Escribir "=== Saldo"
				Escribir "Saldo guardado : ", saldo[1]
				Escribir "=== Historial"
				Si contador_historial = 0 Entonces
					Escribir "No hay historial registrado"
				SiNo
					Escribir "Ultimos registros:"
					Para i <- 1 Hasta contador_historial-1 Con Paso 1 Hacer
						Escribir "-" historial[i]
					FinPara
				FinSi
				Escribir ""
				
			Caso 4: // Salir
				Escribir ""
				Escribir "Saliendo..."
				continuar_menu = Falso
				
			De Otro Modo: // Opcion invalida
				Escribir "!= Opcion invalida"
		FinSegun
	FinMientras
FinAlgoritmo
			