import 'package:blocstatemanagement/cubit/counter_cubit.dart';
import 'package:blocstatemanagement/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CounterCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<CounterCubit,CounterCubitState>(
        builder: (context,state)=>Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is CounterValueUpdate ? Text(state.counter.toString()) : Text('0'),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(onPressed: (){
                    context.read<CounterCubit>().counterIncrease();
                  },child: Icon(Icons.add)),
                  FloatingActionButton(onPressed: (){
                    context.read<CounterCubit>().counterDecrease();
                  },child: Icon(Icons.remove))
                ],
              ),
            ],
          ),
        ),
      )
    ));
  }
}
