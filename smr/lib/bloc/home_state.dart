abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<String> mensajes;

  HomeSuccess(this.mensajes);
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);
}
