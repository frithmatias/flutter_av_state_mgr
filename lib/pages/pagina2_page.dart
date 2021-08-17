import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  StreamBuilder<Usuario>(
          stream: usuarioService.usuarioStream,
          builder: (context, snapshot) {
            return snapshot.hasData 
            ? Text(snapshot.data!.nombre)
            : const Text('PÁGINA 2');
          }
        )
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                final Usuario user = Usuario(nombre: 'Matias', edad: 42, profesiones: ['Programador']); 
                usuarioService.cargarUsuario(user);
              }),
          MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              }),
          MaterialButton(
              child: const Text('Agregar Profesión', style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {})
        ]),
      ),
    );
  }
}
