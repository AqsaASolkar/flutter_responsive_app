import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:flutter/material.dart';

Widget getImage(
    {required String name,
    double? height,
    double? width,
    Color? color,
    BoxFit? fit = BoxFit.fitHeight}) {
  return Image.asset(
    name.toPng,
    fit: fit,
    height: height,
    width: width,
    color: color,
  );
}

List<String> coffeeLogos = [
  'logocoffee1',
  'logocoffee2',
  'logocoffee3',
  'logocoffee4',
  'logocoffee5'
];

Widget logo() {
  return Row(
    children: [
      getImage(name: 'favicon', color: Colors.black),
      const SizedBox(width: 5),
      textWidget(text: 'coffee', textSize: 20),
    ],
  );
}

Widget textWidget(
    {FontWeight textFontWeight = FontWeight.normal,
    required double textSize,
    Color textColor = Colors.black87,
    TextDecoration textDecoration = TextDecoration.none,
    double lineHeight = 1,
    required String text}) {
  return Text(
    text,
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

ElevatedButton elevatedButton(
    {required String text, required VoidCallback onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.black,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
    ),
    onPressed: onPressed,
    child: textWidget(textSize: 16, text: text, textColor: Colors.white),
  );
}

Widget heading(
    {required String text,
    bool isMobile = false,
    bool hideDivider = false,
    double fontSize = 30}) {
  return FittedBox(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hideDivider)
          Container(
            height: 30,
            width: 2,
            color: Colors.orange,
          ),
        if (!hideDivider) const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
              color: Colors.black87,
              fontSize: fontSize,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
