import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String szBtnText;
  final int iFillColor;
  final int iTextColor;
  final double dTextSize;
  final Function callBack;

  const CalcButton({
    Key key,
    this.szBtnText,
    this.iFillColor = 0xFF283637,
    this.iTextColor = 0xFFFFFFFF,
    this.dTextSize = 24,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 75,
        height: 75,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(szBtnText,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: dTextSize,
                ),
              )),
          onPressed: () {
            callBack(szBtnText);
          },
          color: iFillColor != null ? Color(iFillColor) : null,
          textColor: iTextColor != null ? Color(iTextColor) : null,
        ),
      ),
    );
  }
}
