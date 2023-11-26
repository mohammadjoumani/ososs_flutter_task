import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChangeNameEvent>(_mapChangeName);
    on<ClearTextEvent>(_mapClearText);
  }

  _mapChangeName(ChangeNameEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(name: event.name));
  }

  _mapClearText(ClearTextEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(name: ''));
  }
}
