import 'package:flutter/material.dart';

import '../res/ui_helper.dart';

class CoffeeLogos extends StatelessWidget {
  const CoffeeLogos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.15,
          vertical:MediaQuery.of(context).size.height * 0.1
      ),
      child: Wrap(
        children: List.generate(coffeeLogos.length, (index){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: getImage(name: coffeeLogos[index],height: 100,width: 150),
          );
        }),
      ),
    );
  }
}
