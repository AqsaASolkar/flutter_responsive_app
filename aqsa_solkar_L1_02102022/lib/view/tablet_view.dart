import 'package:aqsa_solkar_l1_02102022/view/position_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../res/header.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  _TabletViewState createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // here the desired height
          child: Header(
            headerList: const ['Home', 'Explore', 'Product', 'Premium'],
            onTapHeader: (int index) {
              itemScrollController.jumpTo(index: index);
            },
          )),
      body: PositionScrollableList(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        isMobile: true,
      ),
    );
  }
}
