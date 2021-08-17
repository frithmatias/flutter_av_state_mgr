

class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario({ 
    required this.nombre, 
    required this.edad, 
    required this.profesiones 
  }); 
  // }) : assert(nombre != null); // con null safety, assert ya no es necesario porque desde 
  // el mmomento que estoy definiendo String nombre y no String? nombre, le estoy diciendo a 
  // Dart que nombre es required o NO-NULLABLE.

}