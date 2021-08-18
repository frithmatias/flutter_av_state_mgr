import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 2')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                // aca estoy DENTRO DE UN METODO, no voy a poder redibujar NADA, por lo tanto 
                // voy a poner listen: false.
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                final newUser = Usuario(edad: 42, nombre: 'Matias', profesiones: ['Programador','Desarrollador']);
                usuarioService.setUser = newUser;
              }),
          MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400, 
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.sumarEdad();
              }),
          MaterialButton(
              child: const Text('Agregar Profesión',
              style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.agregarProfesion();
              })
        ]),
      ),
    );
  }
}
