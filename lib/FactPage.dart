import 'package:flutter/material.dart';

class FactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI Chart"),
        ),
      ),
      body: Container(child: Image.asset('images/bmi-table.png')),
    );
  }
}
