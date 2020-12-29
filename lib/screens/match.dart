import 'package:flutter/material.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import '../screens/screens.dart';

typedef IntCallback = Function(int num);

class MatchScreen extends StatefulWidget {
  createState() => MatchScreenState();
}

class MatchScreenState extends State<MatchScreen> {
  Mission mission;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          title: Text('New Match'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              child: MissionSelectScreen(),
            ),
             SizedBox(
              height: 100,
              child: DeploymentSelecyScreen(),
            ),
          ],
        ));
  }
}
