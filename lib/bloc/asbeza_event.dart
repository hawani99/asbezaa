part of 'asbeza_bloc.dart';

abstract class AsbezaEvent extends Equatable {
  const AsbezaEvent();

  @override
  List<Object> get props => [];
}

class LoadAsbeza extends AsbezaEvent {}

class AddAsbeza extends AsbezaEvent {
  final Asbeza asbeza;

  const AddAsbeza(this.asbeza);

  @override
  List<Object> get props => [asbeza];
}

class RemoveAsbeza extends AsbezaEvent {
  final Asbeza asbeza;

  const RemoveAsbeza(this.asbeza);

  @override
  List<Object> get props => [asbeza];
}
