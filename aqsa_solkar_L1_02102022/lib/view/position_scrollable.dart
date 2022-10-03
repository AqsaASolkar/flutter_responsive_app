import 'package:aqsa_solkar_l1_02102022/view/explore_view.dart';
import 'package:aqsa_solkar_l1_02102022/view/premium_page.dart';
import 'package:aqsa_solkar_l1_02102022/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'footer.dart';
import 'landing_page.dart';

class PositionScrollableList extends StatelessWidget {
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  final bool isMobile;
  PositionScrollableList(
      {Key? key,
      required this.itemScrollController,
      this.isMobile = false,
      required this.itemPositionsListener})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      physics: const ClampingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return LandingScreen(isMobile: isMobile);
          case 1:
            return ExploreView(isMobile: isMobile);
          case 2:
            return ProductsView(isMobile: isMobile);
          case 3:
            return PremiumView(isMobile: isMobile);
          case 4:
            return Footer(isMobile: isMobile);
          default:
            return Container();
        }
      },
    );
  }
}
