import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smr/models/model_openia.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final OpenAIService openAIService;

  final List<String> _mensajes = [];

  HomeBloc(this.openAIService) : super(HomeInitial()) {
    on<EnviarMensajeEvent>(_onEnviarMensaje);
  }

  Future<void> _onEnviarMensaje(
    EnviarMensajeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());

      _mensajes.add('Tú: ${event.mensaje}');

      final respuesta = await openAIService.getChatGPTResponse(event.mensaje);

      _mensajes.add('IA: $respuesta');

      emit(HomeSuccess(List.from(_mensajes)));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
