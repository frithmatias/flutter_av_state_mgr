// ignore_for_file: avoid_print

import 'dart:async';
import 'package:estados_app/models/usuario.dart';

// Necesito que NO se puedan crear instancias por fuera de esta clase por lo tanto vamos a definir 
// la clase como privada con _
class _UsuarioService {

  // en este stream va a fluir un tipo Usuario
  final StreamController<Usuario> _userStreamController = StreamController<Usuario>.broadcast();
  Stream<Usuario> get usuarioStream => _userStreamController.stream;

  late Usuario _usuario;
  // GETs
  Usuario get usuario => _usuario;
  // bool get existeUsuario => (_usuario!=null)?true:false;
  // SET
  
  void cargarUsuario(Usuario user){
    _usuario = user;
    _userStreamController.add(user);
  }

  void cambiarEdad(int edad){
    _usuario.edad+=1;
    _userStreamController.add(_usuario);
  }

  cerrarStream(){
    _userStreamController.close();
  }

}

// Cada vez que necesitemos hacer referencia a usuarioService va a devolver siempre la instancia
// usuarioService, sin crear otra, esto es un Singleton. Es una forma simple de crear un Singleton 
// otras son crear un factory constructor, un constructor privado, etc. 
final usuarioService = _UsuarioService();


