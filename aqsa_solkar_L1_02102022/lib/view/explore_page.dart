import 'package:flutter/material.dart';

import '../res/ui_helper.dart';
import 'animation.dart';

class ExploreView extends StatelessWidget {
  final bool isMobile;
  const ExploreView({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.height * 0.07),
      child: Column(
        children: [titleAndButton(), detail(context)],
      ),
    );
  }

  Widget detail(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.13),
        child: Wrap(
            children: List.generate(exploreList.length, (index) {
          return IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isMobile)
                  VerticalDivider(
                    color: index == 0 ? Colors.transparent : Colors.grey,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                  ),
                if (!isMobile) const SizedBox(width: 25),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    SliderAnimation(child: image(exploreList[index].image)),
                    const SizedBox(height: 30),
                    heading(
                        text: exploreList[index].title,
                        hideDivider: true,
                        fontSize: 25),
                    const SizedBox(height: 15),
                    textWidget(
                        textSize: 18, text: exploreList[index].description),
                    const SizedBox(height: 20),
                  ],
                ),
                if (!isMobile) const SizedBox(width: 25),
              ],
            ),
          );
        })));
  }

  Widget image(String imgName) {
    return getImage(name: imgName, height: 100, width: 100);
  }

  Widget titleAndButton() {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (heading(
                  text:
                      'Speciality Coffee that make you \nhappy and cheer you up!')),
              const SizedBox(height: 20),
              elevatedButton(
                onPressed: () {},
                text: 'SEE MORE',
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (heading(
                  text:
                      'Speciality Coffee that make you \nhappy and cheer you up!')),
              elevatedButton(
                onPressed: () {},
                text: 'SEE MORE',
              )
            ],
          );
  }
}

class ExploreObj {
  final String image;
  final String title;
  final String description;
  ExploreObj(
      {required this.image, required this.title, required this.description});
}

List<ExploreObj> exploreList = [
  ExploreObj(
      image: 'specialty1',
      title: 'Selected coffee',
      description: 'description description description \ndescription'),
  ExploreObj(
      image: 'specialty2',
      title: 'Delicious Cookies',
      description: 'description description description \ndescription'),
  ExploreObj(
      image: 'specialty3',
      title: 'Enjoy at Home',
      description: 'description description description \ndescription'),
];
