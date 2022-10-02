import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:flutter/material.dart';


Widget getImage({required String name,double? height,double? width}){
  return Image.asset(name.toPng,fit: BoxFit.fill,height: height,width: width);
}


List<String> coffeeLogos = [
  'logocoffee1',
  'logocoffee2',
  'logocoffee3',
  'logocoffee4',
  'logocoffee5'
];

Widget textWidget(
    {FontWeight textFontWeight = FontWeight.normal,
      required double textSize,
      Color textColor = Colors.black,
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