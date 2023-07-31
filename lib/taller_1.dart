import 'dart:io';

import 'package:taller_1/espacio.dart';

Future<double> consultarPrecioDolar(double dolarOp) {
  Map<int, double> preciosDolar = {1: 4110, 2: 4000, 3: 3975, 4: 3980, 5: 3969};
  return Future.delayed(Duration(seconds: 3), () {
    return preciosDolar[dolarOp] ?? 0;
  });
}

Future<double> consultarProductos(String producto) {
  Map<String, double> productos = {
    'agua': 1300,
    'aceite': 11000,
    'azucar': 5000
  };
  return Future.delayed(Duration(seconds: 4), () {
    return productos[producto] ?? 0;
  });
}

Future<void> cambioSemaforo(String color, int duracion, lista) async {
  await Future.delayed(Duration(seconds: duracion));
  lista.add(color);
  print(color);
}

void main(List<String> arguments) async {
  try {
    List<Espacio> espacios = [];
    List<String> semaforos = [];

    Future<void> cicloSemaforo(int numeroSemaforo) async {
      print("Semaforo N° $numeroSemaforo");
      await cambioSemaforo("ROJO", 5, semaforos);
      await cambioSemaforo("AMARILLO", 3, semaforos);
      await cambioSemaforo("Verde", 2, semaforos);
    }

    for (;;) {
      print("\n1. Ejercicio 1");
      print("3. Ejercicio 3");
      print("4. Ejercicio 4");
      print("5. Ejercicio 5");
      print("0. Salir\n");

      String opcion = stdin.readLineSync()!;

      if (opcion == "0") break;

      switch (opcion) {
        case "1":
          print("Registrar espacio ");
          print("Nombre espacio: ");
          String nombre = stdin.readLineSync()!;
          print("Tipo espacio: ");
          String tipo = stdin.readLineSync()!;

          print("Area espacio: ");
          double area = double.parse(stdin.readLineSync()!);

          if (area < 0) throw Exception("Cero no es permitido");

          print("Capacidad espacio: ");
          int capacidad = int.parse(stdin.readLineSync()!);
          if (capacidad < 0) throw Exception("Cero no es permitido");

          Espacio espacio = Espacio(
              nombre.toUpperCase(), tipo.toUpperCase(), area, capacidad);

          espacio.registrar(espacios, espacio);

          print("\n3. Continuar");
          print("4. Listar\n");

          String opcion2 = stdin.readLineSync()!;

          if (opcion2 == "3") {
            continue;
          } else if (opcion2 == "4") {
            for (int o = 0; o < espacios.length; o++) {
              espacios[o].describir();
              continue;
            }
          }
          break;

        case "3":
          print("\nPrecio del dolar");
          print("1. para 4110");
          print("2. para 4000");
          print("3. para 3975");
          print("4. para 3980");
          print("5. para 3696\n");

          print("\nEscoje una opcion: ");

          double dolarOp = double.parse(stdin.readLineSync()!);
          // print(preciosDolar[dolarOp]);

          print("\nPrecio del dolar");
          print("agua");
          print("aceite");
          print("azucar\n");

          print("\nEscoje producto: ");

          String producto = stdin.readLineSync()!;

          double precioDolar = await consultarPrecioDolar(dolarOp);
          double precioProducto = await consultarProductos(producto);

          double precioDolares = precioProducto / precioDolar;
          print(
              "\nPrecio de $producto \nPesos: $precioProducto \nDolares: $precioDolares \nDia $dolarOp ");

          print("end");

          break;

        case "4":
          for (int i = 0; i <= 5; i++) {
            await cicloSemaforo(i + 1);
          }

          break;

        case "5":
          Map<String, List<int>> aprendises = {};

          for (int o = 0;; o++) {
            print(
                "\n1. Para salir\n2. Para ingresar aprendiz\n3. Para Ver aprendices\n\nEscoje opcion: ");

            int opcion = int.parse(stdin.readLineSync()!);

            if (opcion == 1) break;

            switch (opcion) {
              case 2:
                print("\n2. Para ingresar aprendiz");

                print("Ingresar aprendiz: ");
                String nombre = stdin.readLineSync()!;

                print("Nota 1: ");
                int nota1 = int.parse(stdin.readLineSync()!);

                print("Nota 2: ");
                int nota2 = int.parse(stdin.readLineSync()!);

                print("Nota 3: ");
                int nota3 = int.parse(stdin.readLineSync()!);

                aprendises[nombre] = [nota1, nota2, nota3];

                break;

              case 3:
                print("\n Ver los aprendices");

                if (aprendises.isEmpty) print("\nEsta vacio ome\n");

                for (String aprendiz in aprendises.keys) {
                  // Imprimir la clave
                  print("Aprendiz: $aprendiz");

                  // Imprimir el valor asociado a la clave
                  print("Notas: ${aprendises[aprendiz]}");

                  double sumaNotas = 0;
                  var notas = aprendises[aprendiz]!;
                  var cantidadNotas = aprendises[aprendiz]!.length;

                  for (int i = 0; i < cantidadNotas; i++) {
                    sumaNotas += notas[i];
                  }

                  double promedio = sumaNotas / cantidadNotas;

                  print("Promedio: $promedio");
                }

                break;

              case 4:
                print("\nBuscar aprendiz por letra \n\nPon la letra: ");

                String letra = stdin.readLineSync()!;

                print(letra);

              break;
            }
          }

          break;

        default:
          throw Exception("Ingresa un entero");
      }
    }
  } catch (e) {
    print(e);
  }
}
