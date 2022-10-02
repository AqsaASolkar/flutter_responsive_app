import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:flutter/material.dart';


Widget getImage({required String name}){
  return Image.asset(name.toPng,fit: BoxFit.fill);
}

Widget textWidget(
    {FontWeight textFontWeight = FontWeight.normal,
      required double textSize,
      Color textColor = Colors.white,
      TextDecoration textDecoration = TextDecoration.none,
      double lineHeight = 1, required String text}) {
  return Text(text,
    style: TextStyle(
      fontWeight: textFontWeight,
      fontSize: textSize,
      color: textColor,
      decoration: textDecoration,
      fontFamily: fontBold,
      height: lineHeight,
    ),
  );
}