import 'package:bloc/bloc.dart';
import 'package:blocstatemanagement/bloc/switch/switch_event.dart';
import 'package:blocstatemanagement/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc() : super(SwitchState()){
    on<NotificationEnableAndDisable>(_enableAndDisableNotification);
  }

  void _enableAndDisableNotification(NotificationEnableAndDisable event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}