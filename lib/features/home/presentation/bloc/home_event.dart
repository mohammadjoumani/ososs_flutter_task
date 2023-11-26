part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangeNameEvent extends HomeEvent {
  final String name;

  ChangeNameEvent(this.name);
}

class ClearTextEvent extends HomeEvent {}
