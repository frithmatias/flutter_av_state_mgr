import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario ? Text(usuarioService.usuario!.nombre) : const Text('SIN USUARIO'), 
        actions: [
          IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: (){
            usuarioService.eliminarUsuario();
          }), 
        ],
      ),
      body: usuarioService.existeUsuario ? InfoUsuario(usuarioService.usuario) : const Text('No existe usuario'),
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

  final Usuario? usuario;
  const InfoUsuario(
    this.usuario, {Key? key}
  ) : super(key: key);

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
          ListTile( title: const Text('Nombre'), subtitle: Text(usuario!.nombre)), 
          ListTile( title: const Text('Edad'), subtitle: Text(usuario!.edad.toString())), 
          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          // A partir de Flutter 2 podemos destructurar con el operador Spred los Widgets dentro de la lista
          // ...children: usuario!.profesiones.map((profesion) => ListTile( title: Text(profesion))).toList()

          // o bien podemos enlistarlos dentro de un Column
          Column(  
            children: usuario!.profesiones.map((profesion) => ListTile( title: Text(profesion))).toList(),
          )
         

          // const ListTile( title: Text('Profesion 1')),
          // const ListTile( title: Text('Profesion 2')), 
          // const ListTile( title: Text('Profesion 3')), 


        ],
      ),
    );
  }
}
