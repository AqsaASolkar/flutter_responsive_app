import 'package:aqsa_solkar_l1_02102022/view/position_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../res/header.dart';
import '../res/ui_helper.dart';
import 'footer.dart';

class DeskTopView extends StatefulWidget {
  const DeskTopView({Key? key}) : super(key: key);

  @override
  _DeskTopViewState createState() => _DeskTopViewState();
}

class _DeskTopViewState extends State<DeskTopView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // here the desired height
          child: Header(
            headerList: const ['Home', 'Premium', 'Footer'],
            onTapHeader: (int index) {
              itemScrollController.jumpTo(index: index);
            },
          )),
      body: PositionScrollableList(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
    );
  }
}
