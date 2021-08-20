import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 2')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                // Voy a llamar acá al Cubit en el context con read() para lo cual necesito importar flutter_bloc
                // import 'package:flutter_bloc/flutter_bloc.dart';
                final newUser = Usuario(nombre: 'Matias', edad: 42, profesiones: ['FrontEnd Dev', 'BackEnd Dev']); 
                
                // context.read<UsuarioCubit>().pasarEstadoActivo(newUser);
                // la sintáxis anterior es un poco complicada, mejor podemos obtener la instancia de UsuarioCubit 
                // en el BUILD de la misma forma que hacemos con Provider
                // final usuarioCubit = context.read<UsuarioCubit>();
                // y luego llamar 
                usuarioCubit.pasarEstadoActivo(newUser);

                
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {

                usuarioCubit.cambiarEdad(30);
              }),
          MaterialButton(
              child: const Text('Agregar Profesión',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                usuarioCubit.agregarProfesion('Electrónico');
              })
        ]),
      ),
    );
  }
}
