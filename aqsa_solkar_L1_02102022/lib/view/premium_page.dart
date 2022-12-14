import 'package:aqsa_solkar_l1_02102022/res/get_widget_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/ui_helper.dart';
import 'coffee_logos.dart';

class PremiumView extends StatelessWidget {
  final bool isMobile;
  const PremiumView({Key? key, this.isMobile = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(
              text:
                  'We offer a premium and better quality \npreparation just for you.'),
          const SizedBox(height: 30),
          detail(context),
          const SizedBox(height: 30),
          const Divider(color: Colors.grey),
          CoffeeLogos(isMobile: isMobile),
        ],
      ),
    );
  }

  Widget title(String name) {
    return FittedBox(
      child: textWidget(
          textSize: isMobile ? 20 : 30,
          text: name,
          textFontWeight: FontWeight.w600),
    );
  }

  Widget detail(BuildContext context) {
    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        imageWidget(context),
        isMobile
            ? SizedBox(height: MediaQuery.of(context).size.width * 0.02)
            : SizedBox(width: MediaQuery.of(context).size.width * 0.015),
        isMobile ? description() : Flexible(child: description())
      ],
    );
  }

  Widget imageWidget(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(
            right: isMobile ? 90 : MediaQuery.of(context).size.width * 0.07),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: getImage(
              fit: BoxFit.fitHeight,
              name: 'quality1',
              height: isMobile
                  ? MediaQuery.of(context).size.height * 0.4
                  : MediaQuery.of(context).size.height * 0.5),
        ),
      ),
      Positioned(
          right: isMobile ? 40 : 0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: getImage(
                name: 'quality2',
                height: isMobile
                    ? MediaQuery.of(context).size.height * 0.2
                    : MediaQuery.of(context).size.height * 0.3),
          ))
    ]);
  }

  Widget description() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Premium Coffee'),
        const SizedBox(height: 15),
        title('\$94.99'),
        textWidget(textSize: 16, text: 'Special price', textColor: Colors.grey),
        const SizedBox(height: 15),
        textWidget(
            textSize: 16,
            text: 'product description product description '
                'product description '
                'product description product description',
            textColor: Colors.grey),
        const SizedBox(height: 15),
        actionButtons()
      ],
    );
  }

  Widget actionButtons() {
    return FittedBox(
      child: Row(
        children: [buyNowButton(), const SizedBox(width: 40), seeMoreButton()],
      ),
    );
  }

  Widget buyNowButton() {
    return elevatedButton(
      onPressed: () {},
      text: 'Buy now',
    );
  }

  Widget seeMoreButton() {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          textWidget(textSize: 20, text: 'See more'),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_right_alt,
            color: Colors.black,
            size: 20,
          )
        ],
      ),
    );
  }
}
