import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: calculate(),

));

class calculate extends StatefulWidget {
  @override
  _calculateState createState() => _calculateState();
}

class _calculateState extends State<calculate> {

  String output = '0';

  String _output ='0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';



  buttonPressed(buttonText){

    if(buttonText == 'C'){
      _output = '0';
      num1 =0;
      num2 =0;
      operand ='';
      output = '0';

    }else if(buttonText == '%' || buttonText == '-' || buttonText == '+' || buttonText == 'X' || buttonText == '/'  ){

      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';

    }else if(buttonText == '.'){
      if(output.contains('.')){
        print('already has a decimal');

      }else{
        _output= _output + buttonText;
      }
    }else if(buttonText == '='){
      num2 = double.parse(output);
      if(operand == '%'){
        _output = (num1 % num2).toString();
      }

      if(operand == '-'){
        _output = (num1 - num2).toString();
      }

      if(operand == '+'){
        _output = (num1 + num2).toString();
      }

      if(operand == '/'){
        _output = (num1 / num2).toString();
      }

      if(operand == 'X'){
        _output = (num1 * num2).toString();
      }

      num2 = 0;
      num1 = 0;
      operand = "";
    }else{
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);

    });
  }

   Widget buttons(buttonText){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(30),
        child: Text(buttonText,
        style: TextStyle(
            fontSize: 20,
        ),
        ),
        onPressed: () => buttonPressed(buttonText),

        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
                child: Text(output,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),)
            ),
            Expanded(
              child: Divider(),
            ),
                  Row(
                    children: <Widget>[
                      buttons('C'),
                      buttons('()'),
                      buttons('%'),
                      buttons('/'),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      buttons('7'),
                      buttons('8'),
                      buttons('9'),
                      buttons('X'),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      buttons('6'),
                      buttons('5'),
                      buttons('4'),
                      buttons('-'),
                    ],
                  ),

            Row(
              children: <Widget>[
                buttons('3'),
                buttons('2'),
                buttons('1'),
                buttons('+'),
              ],
            ),

            Row(
              children: <Widget>[
                buttons('+/-'),
                buttons('0'),
                buttons('.'),
                buttons('='),
              ],
            ),

                ],
              ),
        ),
    );
  }
}

