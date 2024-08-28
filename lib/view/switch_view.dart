import 'package:blocstatemanagement/bloc/switch/switch_bloc.dart';
import 'package:blocstatemanagement/bloc/switch/switch_event.dart';
import 'package:blocstatemanagement/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Notification Enable'),
                  Switch(value: state.isSwitch, onChanged: (value) {
                    context.read<SwitchBloc>().add(NotificationEnableAndDisable());
                  })
                ],
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.red.withOpacity(0.5),
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              Slider(value: 0.5, onChanged: (vale) {})
            ],
          );
        },
      ),
    ));
  }
}
