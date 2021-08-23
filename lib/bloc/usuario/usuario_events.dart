part of 'usuario_bloc.dart';

@immutable // va a intentar importar de material, pero es mas liviana la libreria meta de metatags.
abstract class UsuarioEvent {
  
}


class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;
  ActivarUsuario(this.usuario);


  // cuando hago intento hacer un print de la instancia de una clase intenta 
  // hacer un toString, si yo la sobre-escribo puedo devolver cualquier otra cosa.
  @override
  String toString() {
    return 'Instancia de Usuario: ${usuario.nombre}';
  }
}


class CambiarEdad extends UsuarioEvent {
  // todas las propiedades DEBEN ser final porque no van a cambiar
  final int edad;
  CambiarEdad(this.edad);

}


class AgregarProfesion extends UsuarioEvent {
  final String profesion;
  AgregarProfesion(this.profesion);
}

class BorrarUsuario extends UsuarioEvent {
  // no necesito pasar ningún argumento
}