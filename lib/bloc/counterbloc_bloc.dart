import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counterbloc_event.dart';
part 'counterbloc_state.dart';

class CounterblocBloc extends Bloc<CounterblocEvent, CounterblocState> {
  CounterblocBloc() : super(CounterblocInitial());

  @override
  Stream<CounterblocState> mapEventToState(
    CounterblocEvent event,
  ) async* {
    if (event is Increment) {
      if (state is CounterblocInitial) {
        yield CounterBlocValue(0);
      } else {
        yield CounterBlocValue((state as CounterBlocValue).value + 1);
      }
    }
  }
}
