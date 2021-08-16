import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 1')),
      body: const InfoUsuario(),
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
  const InfoUsuario({
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
        children: const [
          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile( title: Text('Nombre')), 
          ListTile( title: Text('Edad')), 
          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile( title: Text('Profesion 1')),
          ListTile( title: Text('Profesion 2')), 
          ListTile( title: Text('Profesion 3')), 


        ],
      ),
    );
  }
}
