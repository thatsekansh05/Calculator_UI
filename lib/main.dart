import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  double num3 = 0.0;
  String operator = "";
  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operator = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operator = buttonText;
      _output = "";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      }
      else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operator == "+") {
        _output = (num1 + num2).toString();
      }
      if (operator == "-") {
        _output = (num1 - num2).toString();
      }
      if (operator == "X") {
        _output = (num1 * num2).toString();
      }
      if (operator == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operator = "";

    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);

    });
  }

  Widget buildButton(String buttonText, Color color,{double height = 20.0, double width = 20.0}) {
    return GestureDetector(
      onTap: () => buttonPressed(buttonText),
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(1.0),
        decoration:  BoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(10.0),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text(
              textAlign:TextAlign.center,
              buttonText,
              style: const TextStyle(fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color:Colors.white,
              ),
            ),
          ]
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const  Text('Calculator'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: <Widget>[
          Container(
           // color: Colors.grey,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2.0),

            ),
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),

            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.black,
            ),
          ),
          Expanded(

            flex: 10,
            child: GridView.count(crossAxisCount: 4,
              childAspectRatio: 0.9,
            children: <Widget>[
              buildButton("7",Colors.blueGrey,height: 30.0, width: 30.0),
              buildButton("8",Colors.blueGrey,height: 30.0, width: 30.0),
              buildButton("9",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("/",Colors.grey,height: 30.0, width: 40.0),
              buildButton("4",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("5",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("6",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("X",Colors.grey,height: 30.0, width: 40.0),
              buildButton("1",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("2",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("3",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("-",Colors.grey,height: 30.0, width: 40.0),
              buildButton(".",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("0",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("00",Colors.blueGrey,height: 30.0, width: 40.0),
              buildButton("+",Colors.grey,height: 30.0, width: 40.0),
              buildButton("CLEAR",Colors.red,height: 30.0, width: 60.0),
              buildButton("=", Colors.orangeAccent,height: 40.0, width: 60.0),
            ],
            ),
          ),
          /*Column(
            children:[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              child:Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child:
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X"),
                ],
              ),
            ),
              Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
             child:Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
       ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
              ),
            ],
          )*/
        ],
      ),
    );
  }
}
