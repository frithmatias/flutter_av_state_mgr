import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 1'), actions: [  
        IconButton( 
          icon: const Icon(Icons.delete), 
          onPressed: (){
            BlocProvider.of<UsuarioBloc>(context).add( BorrarUsuario());
          }
        )
      ]),
      
      // body: const InfoUsuario(),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(  
        builder:(context, state) {
          if (state.existeUsuario ) {
            return InfoUsuario(state.usuario!);
          } else {
            return const Center(  
              child: Text('No hay usuario seleccionado')
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(  
        child: const Icon( Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class InfoUsuario extends StatelessWidget {
  final Usuario usuario;
  const InfoUsuario( this.usuario, {
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
          ListTile( title: Text('Nombre ${usuario.nombre}')), 
          ListTile( title: Text('Edad ${usuario.edad}')), 
          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Column(
            children:  usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()
          )

        ],
      ),
    );
  }
}
