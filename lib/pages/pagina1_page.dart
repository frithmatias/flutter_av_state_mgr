// ignore_for_file: avoid_print

import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 1')),

      // SIN STREAM 
      // body: usuarioService.existeUsuario 
      // ? const InfoUsuario()
      // : const Text('No existe usuario'),
      
      // CON STREAM 
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        // initialData: usuarioService.usuario,
        // este builder se va a ejecutar cada vez que tengamos un nuevo valor de Usuario en el Stream 
        // y ese valor viene en el snapshot
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData 
            ? InfoUsuario(snapshot.data!)
            : const Text('No existe usuario');
        
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
  const InfoUsuario(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  print('infoUsuario ${usuario.edad}');
    
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
          ListTile( title: const  Text('Nombre'), subtitle: Text(usuario.nombre)), 
          ListTile( title: const Text('Edad'), subtitle: Text(usuario.edad.toString())), 
          const  Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const  Divider(),
          const  ListTile( title: Text('Profesion 1')),
          const  ListTile( title: Text('Profesion 2')), 
          const  ListTile( title: Text('Profesion 3')), 
        ],
      ),
    );
  }
}
