import 'package:flutter/material.dart';
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
  String _expression = '';
  String _history = '';

  double _dipSize = 50;

  double dispSize() {
    double _expSize = _dipSize;
    if (_expression.length <= 10) {
      _expSize = 50;
    } else if (_expression.length <= 12) {
      _expSize = 40;
    } else if (_expression.length <= 16) {
      _expSize = 30;
    }
    return _expSize;
  }

  void numClick(String szText) {
    setState(() {
      if (szText == "." && _expression.contains(".")) {
        _expression = _expression;
      } else if (szText == "+") {
        _expression += szText;
      } else if (_expression.length < 15) {
        _expression += szText;
      }
    });
  }

  void opClick(String szText) {
    setState(() {});
  }

  void chooseOperation(String szText) {}

  void clear(String szText) {
    setState(() {
      _expression = '';
    });
  }

  void allClear(String szText) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void calculate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                  _history,
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
                  _expression,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: dispSize(),
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
                    szBtnText: '%',
                    iFillColor: 0xFFd1d1d1,
                    iTextColor: 0xFF000000,
                    dTextSize: 30,
                    callBack: numClick,
                  ),
                  CalcButton(
                    szBtnText: '/',
                    iFillColor: 0xFFFFF9900,
                    iTextColor: 0xFFFFFFFF,
                    dTextSize: 30,
                    callBack: numClick,
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
                    callBack: numClick,
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
                    callBack: numClick,
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
                    callBack: numClick,
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
                    callBack: calculate,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
