part of 'counterbloc_bloc.dart';

abstract class CounterblocState extends Equatable {
  const CounterblocState();

  @override
  List<Object> get props => [];
}

class CounterblocInitial extends CounterblocState {}

class CounterBlocValue extends CounterblocState {
  final int value;
  CounterBlocValue(this.value);

  @override
  List<Object> get props => [value];
}
