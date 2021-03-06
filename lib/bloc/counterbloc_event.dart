part of 'counterbloc_bloc.dart';

abstract class CounterblocEvent extends Equatable {
  const CounterblocEvent();

  @override
  List<Object> get props => [];
}

class Increment extends CounterblocEvent {}
