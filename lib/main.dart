import 'package:estados_app/pages/pagina1_page.dart';
import 'package:estados_app/pages/pagina2_page.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Uso MultiProvider porque puedo necesitar incluir otros servicios
      providers: [  
        // ChangeNotifyProvider es la forma en la cual se va a instanciar la clase
        // Si no voy a usar el context dentro de la función (context){ >acá< } entonces puedo poner 
        // un _ y devolver directamente una instancia de mi clase o Servicio (_) => UsuarioService()
        // ChangeNotifyProvider tiene una propiedad que es lazy y que por defecto es TRUE, si pongo 
        // lazy: false va a crear la intancia inmediatamente despues de crear el Widget.

        ChangeNotifierProvider(lazy: true, create: (_) => UsuarioService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1Page(),
          'pagina2': (_) => const Pagina2Page(),
        }
      ),
    );
  }
}