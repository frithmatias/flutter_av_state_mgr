import 'package:estados_app/controllers/usuario_controller.dart';
import 'package:estados_app/models/usuario.dart';
// import 'package:estados_app/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Con put inyecto una dependencia en el context manejado por GetX puede ser cualquier cosa
    final usuarioController = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA 1')),
      // body: const InfoUsuario(),
      body: Obx(() {
        return usuarioController.existeUsuario.value  
          ? InfoUsuario(usuarioController.usuario.value) 
          : const NoUserInfo();
      }),
      
      floatingActionButton: FloatingActionButton(  
        child: const Icon( Icons.accessibility_new),
        onPressed: () {
          // Navigator.pushNamed(context, 'pagina2');
          // Get.to(() => const Pagina2Page(), arguments: {'nombre':'Matias', 'edad':42});
          Get.toNamed('pagina2', arguments: {'nombre':'Matias', 'edad':42});
        },
      ),
    );
  }
}


class NoUserInfo extends StatelessWidget {
  const NoUserInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No hay data del usuario'));
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
          ListTile( title: Text('Nombre ${usuario.nombre}')), 
          ListTile( title: Text('Edad ${usuario.edad}')), 
          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Column(  
            children: usuario.profesiones.map((profesion) => ListTile( title: Text(profesion))).toList()
          )
        ],
      ),
    );
  }
}
