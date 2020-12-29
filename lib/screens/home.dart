import 'package:flutter/material.dart';
import '../shared/shared.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home'), backgroundColor: Theme.of(context).appBarTheme.color ),
      body: Center(child: Text('Homepage'),),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}