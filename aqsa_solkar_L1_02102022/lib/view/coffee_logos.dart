import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:flutter/material.dart';

import '../res/ui_helper.dart';

class CoffeeLogos extends StatelessWidget {
  final bool isMobile;
  const CoffeeLogos({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height* 0.1),
      child: Wrap(
        spacing: isMobile?20:70,
        children: List.generate(coffeeLogos.length, (index){
          return Image.asset(coffeeLogos[index].toPng,height:isMobile? 100:150);
        }),
      ),
    );
  }
}
