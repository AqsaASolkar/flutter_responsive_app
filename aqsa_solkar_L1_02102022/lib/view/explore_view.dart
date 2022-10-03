import 'package:flutter/material.dart';

import '../res/ui_helper.dart';

class ExploreView extends StatelessWidget {
  final bool isMobile;
  const ExploreView({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        children: [
          isMobile
              ? const Center(
                  child: Text('mobile explore view'),
                )
              : titleAndButton(),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        ],
      ),
    );
  }

  Widget detail() {
    return Container();
  }

  Widget titleAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (heading(
            text: 'Speciality Coffee that make you \nhappy and cheer you up!')),
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
      image: 'speciality1',
      title: 'Selected coffee',
      description: 'description description description \ndescription'),
  ExploreObj(
      image: 'speciality2',
      title: 'Delicious Cookies',
      description: 'description description description \ndescription'),
  ExploreObj(
      image: 'speciality3',
      title: 'Enjoy at Home',
      description: 'description description description \ndescription'),
];
