import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  String result = "0";
  String operand = "";
  double num1 = 0.0;
  double num2 = 0.0;
  buttonEvent(String buttonText) {
    //  print(buttonText);
    if (buttonText == "Clear") {
      result = "0";
      operand = "";
      num1 = 0.0;
      num2 = 0.0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      result = "0";
    } else if (buttonText == ".") {
      if (result.contains(".")) {
        print("Already decimal");
      } else {
        result = result + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        result = (num1 + num2).toString();
      }
      if (operand == "-") {
        result = (num1 - num2).toString();
      }
      if (operand == "*") {
        result = (num1 * num2).toString();
      }
      if (operand == "/") {
        result = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      result = result + buttonText;
    }

    print(result);
    setState(() {
      output = double.parse(result).toStringAsFixed(2);
    });
  }

  Widget forButton(Text1, color1) {
    return Expanded(
      child: RaisedButton(
        padding: EdgeInsets.all(25.0),
        child: Text(Text1, style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          buttonEvent(Text1);
        },
        color: Colors.pinkAccent,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nats Calcy"),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            Expanded(
              child: Divider(),
            ),
            Column(children: <Widget>[
              Row(children: <Widget>[
                forButton("7", "Red"),
                forButton("8", "white"),
                forButton("9", "Pink"),
                forButton("+", "Pink"),
              ]),
              Row(children: <Widget>[
                forButton("4", "Red"),
                forButton("5", "white"),
                forButton("6", "Pink"),
                forButton("-", "Pink"),
              ]),
              Row(children: <Widget>[
                forButton("3", "Red"),
                forButton("2", "white"),
                forButton("1", "Pink"),
                forButton("*", "Pink"),
              ]),
              Row(children: <Widget>[
                forButton(".", "Red"),
                forButton("0", "white"),
                forButton("00", "Pink"),
                forButton("/", "Pink"),
              ]),
              Row(children: <Widget>[
                forButton("Clear", "Red"),
                forButton("=", "white"),
              ]),
            ])
          ],
        )));
  }
}
