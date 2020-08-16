import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import './CalcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({
    Key key,
  }) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _currentOperand = '';
  String _prevOperand = '';

  var operation;

  void numClick(String szText) {
    setState(() {
      if (szText == "." && _currentOperand.contains(".")) {
        DoNothingAction();
      } else if (_currentOperand.length < 15) {
        _currentOperand += szText;
      }
    });
  }

  void opClick(String szText) {
    setState(() {
      chooseOperation(szText);
    });
  }

  void chooseOperation(String szText) {
    this.operation = szText;

    if (_prevOperand != '') {
      this.compute();
    } else {
      this._prevOperand = this._currentOperand;
      this._currentOperand = '';
    }
  }

  void equalClick(szText) {
    setState(() {
      this.compute();
    });
  }

  void compute() {
    double computation;
    double prev = _prevOperand != '' ? double.parse(_prevOperand) : 0.0;
    double curr = _currentOperand != '' ? double.parse(_currentOperand) : 0.0;

    print(this.operation);
    switch (this.operation) {
      case '+':
        computation = prev + curr;
        break;
      case '-':
        computation = prev - curr;
        break;
      case 'x':
        computation = prev * curr;
        break;
      case '/':
        computation = prev / curr;
        break;
      default:
    }

    this._currentOperand = getNumber(computation.toString());
    this._prevOperand = '';
    print(this.operation);
  }

  getNumber(number) {
    var stringNumber = number.toString();
    var integerDigits = stringNumber.split('.')[0];
    var decimalDigits = stringNumber.split('.')[1];
    print(integerDigits);
    print(decimalDigits);
    if (int.parse(decimalDigits) > 0) {
      return stringNumber;
    } else {
      return integerDigits;
    }
  }

  void clear(String szText) {
    setState(() {
      _currentOperand = '';
    });
  }

  void allClear(String szText) {
    setState(() {
      _currentOperand = '';
      _prevOperand = '';
    });
  }

  void calculate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_currentOperand);
    ContextModel cm = ContextModel();

    setState(() {
      _prevOperand = _currentOperand;
      _currentOperand = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xFF000000),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  _prevOperand,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                      color: Color(0xFFb5b5b5)),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  _currentOperand,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 50,
                      ),
                      color: Colors.white),
                ),
                alignment: Alignment(1, 1),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    szBtnText: 'AC',
                    iFillColor: 0xFFd1d1d1,
                    iTextColor: 0xFF000000,
                    dTextSize: 30,
                    callBack: allClear,
                  ),
                  CalcButton(
                    szBtnText: 'C',
                    iFillColor: 0xFFd1d1d1,
                    iTextColor: 0xFF000000,
                    dTextSize: 30,
                    callBack: clear,
                  ),
                  CalcButton(
                    szBtnText: ' ',
                    iFillColor: 0xFFd1d1d1,
                    iTextColor: 0xFF000000,
                    dTextSize: 30,
                    callBack: null,
                  ),
                  CalcButton(
                    szBtnText: '/',
                    iFillColor: 0xFFFFF9900,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: opClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    szBtnText: '7',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '8',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '9',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: 'x',
                    iFillColor: 0xFFFFF9900,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: opClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    szBtnText: '4',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '5',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '6',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '-',
                    iFillColor: 0xFFFFF9900,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: opClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    szBtnText: '1',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '2',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '3',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '+',
                    iFillColor: 0xFFFFF9900,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: opClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    szBtnText: '0',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '00',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '.',
                    iFillColor: 0xFF383836,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '=',
                    iFillColor: 0xFFFFF9900,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: equalClick,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
