
import 'package:estados_app/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController{
  // Al extender con GetxController heredamos un monton de cosas interesantes como 
  // ciclos de vida de una variable, cuando cambia, cuando es seteada por primera vez, etc 
  // lo mas importante es que puedo transformar un bool en un Stream
  RxBool existeUsuario = false.obs; // dynamic, var o RxBool, es lo mismo, Dart lo infiere.
  Rx<Usuario> usuario = Usuario().obs; // 'Rx<Usuario>' > Objeto reactivo que emite un tipo 'Usuario'
  get idProfesion => usuario.value.profesiones.length + 1;

  void cargarUsuario(Usuario usr ) {
    existeUsuario.value = true; // añade true al stream false.obs;
    usuario.value = usr; // añade un usuario al stream Usuario().obs;
  }

  void cambiarEdad(int edad){
    usuario.update((usr) => usr!.edad = edad);
  }

  void agregarProfesion(String prof){
    // usuario.update((usr) => usr!.profesiones.add(prof));
    // para romper referencia en lugar de agreagar una profesion 
    usuario.update((usr) => usr!.profesiones = [...usr.profesiones, prof]);
  }
}