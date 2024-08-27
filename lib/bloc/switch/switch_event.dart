import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{
  const SwitchEvent();
  @override
  List<Object> get props => [];
}

class NotificationEnableAndDisable extends SwitchEvent{}