import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier{
  Usuario? _usuario;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set setUser(Usuario user) {
    _usuario = user;
    
    // Como estoy mezclando mi clase con ChangeNotifier, tengo a disposición el método notifyListeners() 
    // que va a emitir los cambios a TODAS las instancias de UsuarioService por ejemplo 
    // en pagina1 -> final usuarioService = Provider.of<UsuarioService>(context, listen: true);
    // EXCEPTO en aquellas instancias que tengan listen: false. Cuando el Widget recibe una notificación 
    // de que el servicio cambio su estado se VA A REDIBUJAR.
    notifyListeners(); 

  }

  void sumarEdad(){
    _usuario!.edad += 1;
    notifyListeners(); 

  }

  void eliminarUsuario(){
    _usuario = null;
    notifyListeners(); 
  }

  void agregarProfesion(){
    _usuario!.profesiones.add('Nueva profesion');
    notifyListeners(); 
  }
}