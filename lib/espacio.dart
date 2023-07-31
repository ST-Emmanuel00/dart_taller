class Espacio {

  String nombreEspacio;
  String tipoEspacio;
  double area;
  int capacidad;

  Espacio(this.nombreEspacio, this.tipoEspacio, this.area, this.capacidad);


  void describir() {

      print("\nNombre espacio: $nombreEspacio \nTipo espacio: $tipoEspacio \nArea: $area \nCapacidad: $capacidad\n" );
      
  }

  void registrar(map, item) {

    map.add(item);

    print("\nRegistro exitoso\n");
    
  }
}