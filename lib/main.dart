import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:estados_app/pages/pagina1_page.dart';
import 'package:estados_app/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(  
      providers: [  
        // meto una instancia Singleton de UsuarioBloc dentro del context, es decir que 
        // cualquier referencia que haga a este Bloc mediante el CONTEXT va a hacer referencia 
        // a esta misma instancia que creamos acá (=> UsuarioBloc()), nuestro bloc recibe un 
        // estado inicial del usuario podriamos enviarle cualqueir argumento inicial al crear la 
        // instancia 
        BlocProvider(create: (_) => UsuarioBloc()), 
        // BlocProvider2(create: (_) => UsuarioBloc2()),
        // BlocProvider3(create: (_) => UsuarioBloc3()),
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