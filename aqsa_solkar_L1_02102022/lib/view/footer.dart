import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/ui_helper.dart';

class Footer extends StatelessWidget {
  final bool isMobile;
  const Footer({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.15,
            vertical: MediaQuery.of(context).size.height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title('Coffee.'),
            const SizedBox(height: 50),
            footerDetails(),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            isMobile
                ? Column(
                    children: [
                      socialMediaIcons(),
                      const SizedBox(height: 10),
                      copyWriteText('copy write text')
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      socialMediaIcons(),
                      copyWriteText('copy write text')
                    ],
                  )
          ],
        ));
  }

  Widget title(String name) {
    return textWidget(textSize: 30, text: name, textColor: Colors.white);
  }

  Widget footerDetails() {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textField(),
              const SizedBox(height: 10),
              titleDescription('Address', '9876 Halcer', 'lima,la liberted'),
              const SizedBox(height: 10),
              titleDescription('Contact', '+9889898989', 'coffe@email.com'),
              const SizedBox(height: 10),
              titleDescription('Office', 'Monday-Saturday', '10AM-5PM'),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textField(),
              titleDescription('Address', '9876 Halcer', 'lima,la liberted'),
              titleDescription('Contact', '+9889898989', 'coffe@email.com'),
              titleDescription('Office', 'Monday-Saturday', '10AM-5PM'),
            ],
          );
  }

  Widget textField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(textSize: 16, text: 'Subscribe', textColor: Colors.grey),
        const SizedBox(height: 5),
        const SizedBox(
          width: 200,
          child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                  hintStyle: TextStyle(color: Colors.grey))),
        ),
      ],
    );
  }

  Widget titleDescription(String title, String number, String address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(textSize: 30, text: title, textColor: Colors.white),
        const SizedBox(height: 20),
        textWidget(textSize: 16, text: number, textColor: Colors.grey),
        const SizedBox(height: 8),
        textWidget(textSize: 16, text: address, textColor: Colors.grey),
      ],
    );
  }

  Widget socialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.facebook, size: 26, color: Colors.grey),
        SizedBox(width: 8),
        Icon(Icons.facebook, size: 26, color: Colors.grey),
        SizedBox(width: 8),
        Icon(Icons.facebook, size: 26, color: Colors.grey),
      ],
    );
  }

  Widget copyWriteText(String name) {
    return textWidget(textSize: 16, text: name, textColor: Colors.grey);
  }
}
