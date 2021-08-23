part of 'usuario_bloc.dart';

class UsuarioState {

  // final define mis propiedades inmutables, no las voy a poder cambiar.
  final bool existeUsuario;
  final Usuario? usuario;

  // UsuarioState({ this.usuario }) <- no estoy haciendo esto porque estaría inicializando usuario, y no quiero eso.
  // voy a recibir un usuario 'user', y existeUsuario lo voy a inicial sólo si recibo el 'user'
  // para eso podría utilizar el cuerpo del constructor con {}, pero como sólo quiero utilizar instrucciones 
  // pequeñas puedo utilizar dos puntos :
  UsuarioState({ Usuario? user }) : usuario = user, existeUsuario = user!=null ? true : false;

  // voy a crear un método copyWith que me devuelva una instancia de UsuarioState (esta misma clase)
  UsuarioState copyWith({Usuario? usuario}) => UsuarioState(user: usuario);
  UsuarioState estadoInicial() => UsuarioState(); // user: null, existeUsuario: false

}