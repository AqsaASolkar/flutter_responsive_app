import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:aqsa_solkar_l1_02102022/view/coffee_logos.dart';
import 'package:flutter/material.dart';

import '../res/ui_helper.dart';
import 'footer.dart';

class DeskTopView extends StatefulWidget {
  const DeskTopView({Key? key}) : super(key: key);

  @override
  _DeskTopViewState createState() => _DeskTopViewState();
}

class _DeskTopViewState extends State<DeskTopView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: MediaQuery.of(context).size.height,
      children: const [
        LandingScreen(),
        CoffeeLogos(),
        Footer(),
      ],
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 5, child: description(context)),
        Expanded(flex: 5, child: getImage(name:'home')),
      ],
    );
  }
  Widget description(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.15,
          right:MediaQuery.of(context).size.width * 0.05),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:MediaQuery.of(context).size.height * 0.2),
          textWidget(text:'Choose Your \nFavourite Coffee \nAnd Enjoy.', textSize: 50,
              lineHeight: 1.3,textFontWeight: FontWeight.bold,textColor: Colors.white),
          const SizedBox(height: 20),
          textWidget(text: 'Buy the best and delicious coffee', textSize: 20,textColor: Colors.grey),
          const SizedBox(height: 20),
          const Divider(color: Colors.grey,),
          const SizedBox(height: 20),
          detail(),
        ],
      ),
    );
  }

  Widget detail(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDescription('120K','Testimonial','Testimonial from \nvarious customers who \ntrust us'),
        const SizedBox(width: 20),
        titleDescription('340+','Exclusive Product', 'Premium with \nquality ingredients.'),
      ],
    );
  }

  Widget titleDescription(String title,String number,String address){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(textSize: 40, text: title,textColor: Colors.amber),
        const SizedBox(height: 20),
        textWidget(textSize: 16, text: number,textColor: Colors.white),
        const SizedBox(height: 8),
      ],
    );
  }

}


