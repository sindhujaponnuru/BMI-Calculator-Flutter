import 'package:bmi_calculator/FactPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result;
  num height;
  num weight;
  TextEditingController textEditingControllerHeight = TextEditingController();
  TextEditingController textEditingControllerWeight = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          title: Center(
        child: Text(
          "BMI Calculator",
        ),
      )),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Enter your height and weight to calculate BMI",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: textEditingControllerHeight,
                onSubmitted: (String heightEntered) {
                  setState(() {
                    height = num.parse(heightEntered);
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Height",
                    hintText: "Enter height in m"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: textEditingControllerWeight,
                onSubmitted: (String weightEntered) {
                  weight = num.parse(weightEntered);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter weight in kg",
                    labelText: "Weight"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text("Calculate"),
                onPressed: () {
                  setState(() {
                    result = calculateBMI();
                  });
                },
              ),
            ),
            Container(
              child: Text(
                "Your BMI is $result",
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.all(5.0),
            ),
            Container(
              child: RaisedButton(
                child: Text("View BMI Chart"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FactPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String calculateBMI() {
    return (weight / (height * height)).round().toString();
  }
}
