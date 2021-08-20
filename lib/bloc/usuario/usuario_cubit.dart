// import 'package:flutter/material.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  // Cubit necesita especificar el tipo y un estado inicial
  // UsuarioCubit(int initialState) : super(initialState);
  // Pero no vamos a manejar primitivos como un entero, sino estados que tiene varias propiedades
  UsuarioCubit() : super(UsuarioInitialState());

  void pasarEstadoActivo(Usuario user) {
    // emito el nuevo estado con emit() que es un metodo heredado de cubit, Pagina 1 está escuchando
    // los cambios con BlocBuilder
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    // emito el nuevo estado con emit() que es un metodo heredado de cubit, Pagina 1 está escuchando
    // los cambios con BlocBuilder
    final currentState = state;

    // Verifico si el usuario está activo, porque si no existe usuario me va a dar error

    if (currentState is UsuarioActivo) {
      // currentState.usuario.edad = edad;
      // emit(UsuarioActivo(currentState.usuario));

      // para que page1 reciba los cambios tengo que emitir el nuevo estado, y en teoría esto funciona
      // bien, el problema de hacer esto es que el estado está MUTANDO y yo necesito enviar un nuevo estado.

      // para evitar esto, voy a crear un metodo en el modelo que se llame copyWith y me devueva un nuevo usuario.
      final newUser = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(
          newUser)); // regresamos un NUEVO ESTADO y no la MUTACION del estado anterior
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final List<String> profesiones = currentState.usuario.profesiones;
      profesiones.add(profesion);
      final newUser = currentState.usuario.copyWith(profesiones: profesiones);
      emit(UsuarioActivo(newUser));
    }
  }


  void eliminarUsuario(){
    emit(UsuarioInitialState());
  }
}
