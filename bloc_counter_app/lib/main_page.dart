import 'package:bloc_counter_app/bloc/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// body
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if(state is InitialState) {
            return _counter(context, 0);
          }

          if(state is UpdateState) {
            return _counter(context, state.counter);
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _counter(BuildContext context, int counter) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterBloc>().add(NumberDecrease()),
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove, color: Colors.white),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(counter.toString(), style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),),
              ),

              FloatingActionButton(
                onPressed: () => context.read<CounterBloc>().add(NumberIncrease()),
                backgroundColor: Colors.green,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
