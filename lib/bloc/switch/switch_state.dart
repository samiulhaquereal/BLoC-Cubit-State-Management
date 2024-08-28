import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  SwitchState({
    this.isSwitch = false,
    this.slider = 1.0
  });

  bool isSwitch;
  double slider;

  SwitchState copyWith({bool? isSwitch,double? slider}){
    return SwitchState(
        isSwitch: isSwitch ?? this.isSwitch,
        slider: slider ?? this.slider
    );
}

  @override
  List<Object> get props => [isSwitch,slider];
}