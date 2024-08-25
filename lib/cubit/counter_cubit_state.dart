import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable{
  const CounterCubitState();
}

class CounterInitiate extends CounterCubitState{

  @override
  List<Object?> get props => [];
}

class CounterValueUpdate extends CounterCubitState{

  int counter;

  CounterValueUpdate({required this.counter});

  @override
  List<Object?> get props => [counter];

}