part of 'asbeza_bloc.dart';

abstract class AsbezaState extends Equatable {
  const AsbezaState();

  @override
  List<Object> get props => [];
}

class AsbezaLoading extends AsbezaState {
  const AsbezaLoading();
}

class AsbezaLoaded extends AsbezaState {
  final List<Asbeza> history;
  final List<Asbeza> asbeza;

  const AsbezaLoaded({required this.history, required this.asbeza});
  @override
  List<Object> get props => [];
}
