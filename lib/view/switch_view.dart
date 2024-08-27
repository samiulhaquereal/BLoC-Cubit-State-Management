import 'package:flutter/material.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Notification Enable'),
              Switch(value: true, onChanged: (value){})
            ],
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.red.withOpacity(0.5),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 20),
          Slider(value: 0.5, onChanged: (vale){})
        ],
      ),
    ));
  }
}
