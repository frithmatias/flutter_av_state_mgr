// ignore_for_file: avoid_print

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();


    return Scaffold(
      appBar: AppBar(
        actions: [             
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: (){
              usuarioCubit.eliminarUsuario();
            }
          ) 
        ],
        title: const Text('PAGINA 1')
        ),

      // body: const InfoUsuario(),
      body: const MyBody(), // Extraigo el Widget porque el código crecio mucho 
      floatingActionButton: FloatingActionButton(  
        child: const Icon( Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class MyBody extends StatelessWidget {
// Este Widget se construye en base al estado del Cubit 

  const MyBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit,UsuarioState>(builder: (_, state){
      
      // Todos los builders tienen que regresar un Widget 

      print(state); 
      // Antes de hacer click en ESTABLECER USUARIO en PAGINA 2
      // > Instance of 'UsuarioInitialState'
      // Después de hacer click en ESTABLECER USUARIO en PAGINA 2
      // > Instance of 'UsuarioActivo'

      // Si yo no quiero que me devuelva Instance of 'UsuarioInitialState', sino un texto con detalles 
      // sobre el estado, en USUARIO_STATE.DART en la clase UsuarioInitialState hago un override de toString() 
      // y así puedo devolver un string con la descripción de mi estado.
      // @override 
      // String toString(){
      //   return 'UsuarioInicial: existeUsuario: false';
      // }
      

      // También podría hacer un Switch con -> 
      // switch(state.runtimeType){
      // }
      if(state is UsuarioInitialState){ // si es una instancia de la clase UsuarioInitialState
        return const Center(child: Text('No hay información del usuario'));
      } else {
        state as UsuarioActivo;
        // aquí, state es una instancia de UsuarioActivo que tiene una propiedad usuario PERO si yo 
        // hago state.usuario me va a dar un error tengo que decirle a dart que es de tipo UsuarioActivo 
        // puedo hacer un -> else if(state is UsuarioActivo) o definiendolo con -> state as UsuarioActivo;
        return InfoUsuario(state.usuario);
      }

      // return const InfoUsuario();
    });
  }
}

class InfoUsuario extends StatelessWidget {

  final Usuario usuario;

  const InfoUsuario(this.usuario, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile( title: const Text('Nombre'), subtitle: Text(usuario.nombre)), 
          ListTile( title: const Text('Edad'), subtitle: Text(usuario.edad.toString())), 
          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Column(  
            children: usuario.profesiones.map((profesion) => ListTile( title: Text(profesion))).toList(),
          )


        ],
      ),
    );
  }
}
