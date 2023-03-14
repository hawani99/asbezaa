import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/asbeza_model.dart';

part 'asbeza_event.dart';
part 'asbeza_state.dart';

class AsbezaBloc extends Bloc<AsbezaEvent, AsbezaState> {
  AsbezaBloc() : super(AsbezaLoading()) {
    on<LoadAsbeza>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const AsbezaLoaded(asbeza: [], history: []));
    });
    on<AddAsbeza>(
      (event, emit) async {
        if (state is AsbezaLoaded) {
          final state = this.state as AsbezaLoaded;
          emit(
            AsbezaLoaded(
                asbeza: List.from(state.asbeza)..add(event.asbeza),
                history: List.from(state.history)..add(event.asbeza)),
          );
        }
      },
    );
    on<RemoveAsbeza>(
      (event, emit) async {
        if (state is AsbezaLoaded) {
          final state = this.state as AsbezaLoaded;
          emit(
            AsbezaLoaded(
                asbeza: List.from(state.asbeza)..remove(event.asbeza),
                history: List.from(state.history)..remove(event.asbeza)),
          );
        }
      },
    );
  }
}
