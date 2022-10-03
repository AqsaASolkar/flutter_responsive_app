import 'package:aqsa_solkar_l1_02102022/res/get_widget_size.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../res/ui_helper.dart';
import 'animation.dart';

class LandingScreen extends StatefulWidget {
  final bool isMobile;
  final ItemScrollController itemScrollController;
  const LandingScreen(
      {Key? key, this.isMobile = false, required this.itemScrollController})
      : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Size? widgetSize;
  Size? mobileSize;
  @override
  Widget build(BuildContext context) {
    return WidgetSize(
        onChange: (Size size) {
          setState(() {
            widgetSize = size;
            print('size---${size.height}');
          });
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: widget.isMobile
                  ? Column(
                      children: [
                        WidgetSize(
                            onChange: (Size size) {
                              setState(() {
                                mobileSize = size;
                                print('size---${size.height}');
                              });
                            },
                            child: description(context)),
                        getImage(name: 'home'),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: description(context)),
                          Expanded(
                              flex: 1,
                              child: getImage(
                                  name: 'home',
                                  height: MediaQuery.of(context).size.height,
                                  fit: BoxFit.cover)),
                        ],
                      ),
                    ),
            ),
            Positioned(
                top: widget.isMobile
                    ? (widgetSize != null ? (mobileSize!.height) - 60 : 0)
                    : (widgetSize != null ? widgetSize!.height / 2 : 0),
                left: (widgetSize != null ? (widgetSize!.width / 2) - 60 : 0),
                child: InkWell(
                    onTap: () {
                      widget.itemScrollController.scrollTo(
                          index: 1, duration: const Duration(seconds: 1));
                    },
                    child: SliderAnimation(
                        child: getImage(name: 'scroll', height: 120))))
          ],
        ));
    //   LayoutBuilder(
    //     builder: (BuildContext context, BoxConstraints constraints) {
    //   return ;
    // });
  }

  Widget description(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: widget.isMobile
            ? EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1)
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
