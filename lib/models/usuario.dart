class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario(
      {required this.nombre, required this.edad, required this.profesiones});

  Usuario copyWith({String? nombre, int? edad, List<String>? profesiones}) {
    return Usuario(
        // si no recibo un valor como argumento voy a usar el que tiene la instancia
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones);
  }

  // o con función de flecha y el return implícito
  Usuario copyWith2({String? nombre, int? edad, List<String>? profesiones}) =>
      Usuario(
          // si no recibo un valor como argumento voy a usar el que tiene la instancia
          nombre: nombre ?? this.nombre,
          edad: edad ?? this.edad,
          profesiones: profesiones ?? this.profesiones);
}
