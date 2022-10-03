import 'package:flutter/material.dart';

import '../res/ui_helper.dart';

class LandingScreen extends StatelessWidget {
  final bool isMobile;
  const LandingScreen({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: isMobile
          ? Column(
              children: [
                description(context),
                getImage(name: 'home'),
              ],
            )
          : IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(flex: 5, child: description(context)),
                  Expanded(
                      flex: 5,
                      child: getImage(
                          name: 'home',
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover)),
                ],
              ),
            ),
    );
  }

  Widget description(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: isMobile
            ? EdgeInsets.zero
            : EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.03),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              textWidget(
                  text: 'Choose Your \nFavourite Coffee And \nEnjoy.',
                  textSize: 40,
                  lineHeight: 1.3,
                  textFontWeight: FontWeight.bold,
                  textColor: Colors.white),
              const SizedBox(height: 20),
              textWidget(
                  text: 'Buy the best and delicious coffee',
                  textSize: 14,
                  textColor: Colors.grey),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              detail(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget detail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDescription('120K', 'Testimonial',
            'Testimonial from \nvarious customers who \ntrust us'),
        const SizedBox(width: 20),
        titleDescription('340+', 'Exclusive Product',
            'Premium \npreparation with \nquality ingredients.'),
      ],
    );
  }

  Widget titleDescription(String title, String number, String address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(textSize: 25, text: title, textColor: Colors.amber),
        const SizedBox(height: 16),
        textWidget(textSize: 16, text: number, textColor: Colors.white),
        const SizedBox(height: 8),
        FittedBox(
            child: textWidget(
                textSize: 16, text: address, textColor: Colors.grey)),
      ],
    );
  }
}
