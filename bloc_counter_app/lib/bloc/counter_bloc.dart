import 'package:bloc_counter_app/bloc/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  int counter = 0;
  CounterBloc() : super(InitialState()) {
    on < NumberIncrease > (onNumberIncrease);
    on < NumberDecrease > (onNumberDecrease);
  }


  void onNumberIncrease(NumberIncrease event, Emitter<CounterStates> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter));
  }

  void onNumberDecrease(NumberDecrease event, Emitter<CounterStates> emit) async {

    if(counter <= 0) {
      counter = 0;
    } else {
      counter = counter - 1;
    }
    emit(UpdateState(counter));
  }

}