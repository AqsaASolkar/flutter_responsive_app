import 'package:flutter/material.dart';

import '../res/ui_helper.dart';
import 'coffee_logos.dart';

class PremiumView extends StatelessWidget {
  final bool isMobile;
  const PremiumView({Key? key,this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.15,
    vertical:MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('We offer a premium and better quality \npreparation just for you.'),
          const SizedBox(height: 30),
         detail(context),
          const SizedBox(height: 30),
          const Divider(color: Colors.grey),
          CoffeeLogos(isMobile: isMobile),

        ],
      ),
    );
  }

  Widget title(String name){
    return textWidget(textSize: isMobile?20:30, text: name);
  }

  Widget detail(BuildContext context){
    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getImage(name: 'quality1',
            height: isMobile? MediaQuery.of(context).size.height * 0.4:MediaQuery.of(context).size.height * 0.5,
            width:isMobile? MediaQuery.of(context).size.width * 0.8:MediaQuery.of(context).size.width * 0.3),
        isMobile?SizedBox(height:MediaQuery.of(context).size.width * 0.02):SizedBox(width:MediaQuery.of(context).size.width * 0.04),
        description()
      ],
    );
  }

  Widget description(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Premium Coffee'),
        const SizedBox(height: 15),
        title('\$94.99'),
        textWidget(textSize: 16, text: 'Special price',textColor: Colors.grey),
        const SizedBox(height: 15),
        textWidget(textSize: 16, text: 'product description product \ndescription '
            'product description '
            '\nproduct description product description',textColor: Colors.grey),
        const SizedBox(height: 15),
        actionButtons()
      ],
    );
  }

  Widget actionButtons(){
    return Row(
      children: [
        buyNowButton(),
        const SizedBox(width: 40),
        seeMoreButton()
      ],
    );
  }

  Widget buyNowButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
      onPressed: () {},
      child:  textWidget(textSize: 16,text: 'Buy Now',textColor: Colors.white),
    );
  }

  Widget seeMoreButton(){
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          textWidget(textSize: 20,text: 'See more'),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_right_alt,color: Colors.black,size: 20,)
        ],
      ),
    );
  }

}
