import 'package:estados_app/controllers/usuario_controller.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments); // {nombre: Matias, edad: 42}
    // Necesito saber cual es la instancia de mi usuarioController
    final usuarioController = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 2')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                usuarioController.cargarUsuario(Usuario(
                    nombre: 'Matias',
                    edad: 42,
                    profesiones: ['1. Dev', '2. Electronico']));
                // snackbar rápido
                Get.snackbar(
                    'Guardar Usuario', 
                    'El usuario fue guardado correctamente', 
                    backgroundColor: Colors.white,
                    boxShadows: [  
                      const BoxShadow(
                        color: Colors.black38, 
                        //spreadRadius: 10,
                        blurRadius: 10
                      )
                    ]
                );
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                usuarioController.cambiarEdad(30);
              }),
          MaterialButton(
              child: const Text('Agregar Profesión',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                usuarioController.agregarProfesion(
                    '${usuarioController.idProfesion}. Jugar RDR');
              }),
          MaterialButton(
              child: const Text('Cambiar tema',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              })
        ]),
      ),
    );
  }
}
