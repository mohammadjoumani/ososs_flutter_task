part of 'home_bloc.dart';

class HomeState {
  final String name;

  HomeState({
    this.name = '',
  });

  HomeState copyWith({
    String? name,
  }) {
    return HomeState(
      name: name ?? this.name,
    );
  }
}
