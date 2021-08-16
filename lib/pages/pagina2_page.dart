import 'package:flutter/material.dart';

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
              onPressed: () {}),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {}),
          MaterialButton(
              child: const Text('Agregar Profesión',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              color: Colors.blue.shade400,
              onPressed: () {})
        ]),
      ),
    );
  }
}
