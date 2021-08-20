

class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario({ 
    required this.nombre, 
    required this.edad, 
    required this.profesiones 
  });

  // Cuando cambio una propiedad tengo que crear un NUEVO usuario, esto soluciona el problema 
  // de que no puedo cambiar propiedades definidas como FINAL 
  Usuario copyWith({ String? nombre, int? edad, List<String>? profesiones }){
    return Usuario(
      // si no recibo un valor como argumento voy a usar el que tiene la instancia
      nombre: nombre ?? this.nombre, 
      edad : edad ?? this.edad, 
      profesiones: profesiones ?? this.profesiones
    );
  }
}