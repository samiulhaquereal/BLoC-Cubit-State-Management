import 'package:blocstatemanagement/bloc/counter/counter_bloc.dart';
import 'package:blocstatemanagement/bloc/counter/counter_event.dart';
import 'package:blocstatemanagement/bloc/counter/counter_state.dart';
import 'package:blocstatemanagement/cubit/counter_cubit.dart';
import 'package:blocstatemanagement/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: BlocBuilder<CounterBloc,CounterState>(
          builder: (context,state)=>Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.counter.toString()),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                        onPressed: (){
                          context.read<CounterBloc>().add(IncrementCounter());
                        },child: Icon(Icons.add)),
                    FloatingActionButton(onPressed: (){
                      context.read<CounterBloc>().add(DecrementCounter());
                    },child: Icon(Icons.remove))
                  ],
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        )
    ));
  }
}