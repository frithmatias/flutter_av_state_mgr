// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estados_app/models/usuario.dart';
// import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'usuario_events.dart';
part 'usuario_state.dart';

// Voy a extender de Bloc de bloc o flutter_bloc, es igual, también tengo que definir dos cosas, 
// como se estructuran mis EVENTOS y ESTADOS ->  extends Bloc<EVENTOS, ESTADOS>
// - EVENTOS: El Bloc va a recibir eventos de tipo UsuarioEvent, o sea solo los eventos 
// extendidos de la clase UsuarioEvent.
// - ESTADOS: También tenemos el UsuarioState que es el estado actual del Bloc.

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState>{
  
  // Constructor: cuando inicialice mi bloc puedo mandarle mi estado inicial
  // UsuarioBloc(UsuarioState initialState) : super(initialState);
  UsuarioBloc() : super(UsuarioState());


  @override // esta función recibe un evento y cambia el estado
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    
    // Debe retornar un Stream de tipo UsuarioState sino me va a dar el siguiente error:
    // Error: A non-null value must be returned since the return type 'Stream<UsuarioState>' doesn't allow null.

    // No con un RETURN sino con un YIELD, el yield SOLO FUNCIONA CON ASYNC*.
    // async -> retorna un future 
    // async* -> returna un stream
    if(event is ActivarUsuario){
      // yield UsuarioState(user: event.usuario);
      yield state.copyWith(usuario: event.usuario);

    } else if (event is CambiarEdad){
      
      // yield UsuarioState(user: state.usuario!.copyWith(edad: event.edad));
      yield state.copyWith(usuario: state.usuario!.copyWith(edad: event.edad));

    } else if (event is AgregarProfesion){   
      
      final List<String> profesiones = state.usuario!.profesiones;
      profesiones.add(event.profesion);
      
      // yield UsuarioState(user: state.usuario!.copyWith(profesiones: profesiones));
      yield state.copyWith(usuario: state.usuario!.copyWith(profesiones: profesiones));

    } else if (event is BorrarUsuario){   
      
      // UsuarioState -> final Usuario? usuario; // <- usuario es opcional
      // si no le paso 'user' a mi USUARIO_STATE.DART, lo setea en NULL
      // yield UsuarioState(); 
      
      // yield state.copyWith( usuario: null );
      yield state.estadoInicial();
    }
   
  }

}

