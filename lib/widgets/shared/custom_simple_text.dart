

import 'package:flutter/material.dart';

class CSimpleTxt extends StatelessWidget {

  final String fTxt;
  final double fSize;
  final String fFamily;
  final Color fColor;
  final FontWeight fWeight;
  final TextAlign fAlign;
  final int? fMaxLines;
  final FontStyle fFontStyle;
  final TextDecoration txtLine;

  const CSimpleTxt({
    super.key,
    required this.fTxt,
    required this.fSize,
    this.fFamily = 'Regular',
    this.fColor = Colors.black,
    this.fWeight = FontWeight.normal,
    this.fAlign = TextAlign.left,
    this.fMaxLines,
    this.fFontStyle = FontStyle.normal,
    this.txtLine = TextDecoration.none
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      fTxt,
      textAlign: fAlign,
      maxLines: fMaxLines,
      overflow: (fMaxLines == null) ? null : TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fSize,
        fontFamily: fFamily,
        color: fColor,
        fontWeight: fWeight,
        fontStyle: fFontStyle,
        decoration: txtLine
      )
    );
  }

}