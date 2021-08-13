import 'package:flutter/material.dart';
import 'package:light/ui/widgets/simple_round_icon_button.dart';
import 'package:torch_controller/torch_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TorchController();
  bool isOn = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Light App'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: controller.isTorchActive,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(snapshot.data != null && isOn
                        ? 'Is torch on? Yes 😉'
                        : 'Is torch on? No 😕');
                  }
                  return Container();
                }),
            SimpleRoundIconButton(
              iconColor: Colors.black,
              onPressed: () {
                controller.toggle(intensity: null); // If iOS the intensity can be from "0" to "1"
                setState(() {
                  isOn = !isOn;
                });
              },
              buttonText: Text(isOn ? 'Light Off' : 'Light On'),
              icon: Icon(isOn ? Icons.dark_mode : Icons.light_mode),
              iconAlignment: Alignment.centerRight,
              backgroundColor: isOn ? Colors.deepPurple : Colors.cyan,
            ),
          ],
        ),
      );
  }
}