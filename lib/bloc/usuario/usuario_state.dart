part of 'usuario_cubit.dart';

/// Con Cubit vamos a manejar los estados INMUTABLES es decir no van a cambiar 
/// Todos los estados tienen que tener relación entre si, esto no significa que la data 
/// tenga que ser congruente porque pueden ser usuarios distintos, que un estado tenga 
/// una propiedad booleana y el otro no, etc. Lo importante es que le digamos a nuestro
/// Cubit que TIPO DE ESTADO es, poder decirle que tipo de clase es el estado al que yo
/// me quiero mover. Para esto vamos a crear una clase abstracta.

/// @immutable: no quiero que cambie, para esto es necesario importar en mi PART OF 
/// (usuario_cubit.dart) la librería de material, pero podríamos también solo importar la 
/// librería de los metatags > import 'package:meta/meta.dart';
@immutable 
abstract class UsuarioState {}

/// Estado inicial de mi aplicación: Vamos a definir todas las propiedades que el usuario 
/// inicial tiene, por ejemplo necesito definir que en el estado inicial no existe usuario. 
class UsuarioInitialState extends UsuarioState {
  final existeUsuario = false;

  @override 
  String toString(){
    return 'UsuarioInicial: existeUsuario: false';
  }
}
  

/// Al extender de UsuarioState ahora le puedo enviar las propiedades a mi UsuarioCubit 
/// extendiendolo también de UsuarioState.
/// class UsuarioCubit extends Cubit< [[UsuarioState]] > {

/// Creamos un nuevo ESTADO, que puede ser de un usuario activo
class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario; 
  /// voy a inicializarla en el único lugar donde podemos inicializar una propiedad FINAL, que es 
  /// en el constructor.
  UsuarioActivo(this.usuario);
}

