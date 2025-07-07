abstract class HomeEvent {}

class EnviarMensajeEvent extends HomeEvent {
  final String mensaje;

  EnviarMensajeEvent(this.mensaje);
}
