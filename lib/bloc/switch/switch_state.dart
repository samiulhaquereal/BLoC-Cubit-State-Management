import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  SwitchState({this.isSwitch = false});

  bool isSwitch;
  SwitchState copyWith({bool? isSwitch}){
    return SwitchState(
        isSwitch: isSwitch ?? this.isSwitch
    );
}

  @override
  List<Object> get props => [isSwitch];
}