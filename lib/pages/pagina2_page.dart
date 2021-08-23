import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 2')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                final usuario = Usuario(nombre: 'Matias', edad: 42, profesiones: ['WebDev', 'Electrónico']);
                usuarioBloc.add( 
                  // ADD(): Notifies the [Bloc] of a new [event] which triggers [mapEventToState]. If [close] has already been 
                  // called, any subsequent calls to [add] will be ignored and will not result in any subsequent state changes.
                  ActivarUsuario(usuario) // EVENTO EN USUAIRO_EVENTS.DART
                );
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                usuarioBloc.add( 
                  CambiarEdad(30) // EVENTO EN USUAIRO_EVENTS.DART
                );

              }),
          MaterialButton(
              child: const Text('Agregar Profesión',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {

                usuarioBloc.add(AgregarProfesion('jugador de RDR'));

              })
        ]),
      ),
    );
  }
}
