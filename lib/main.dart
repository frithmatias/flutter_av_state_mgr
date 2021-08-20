import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/pages/pagina1_page.dart';
import 'package:estados_app/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    /// Con CTRL+. sobre MaterialApp vamos a ver muchos gestores que NO vamos a usar por ahora, 
    /// como BlocBuilder, BlocSelector, BlocListener, BlocConsumer y BlocProvider.
    /// Por ahora lo vamos a hacer manualmente con CTRL+. > Wrap with Widget > MultiBlocProvider
    /// Que es como MultiProvider pero en lugar de servicios vamos a poner Cubits.
    return MultiBlocProvider(  
      providers: [  
        
        // Voy a inicializar el estado inicial de mis Cubits. Con esto todos los widgets de mi 
        // aplicación ya saben que existe una instancia de mi UsuarioCubit dentro del context.
        BlocProvider(create: (_) => UsuarioCubit())
        
        // Similar a como hacíamos con 
        // return MultiProvider(
        // providers:[
        //  ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false)
        // ])

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