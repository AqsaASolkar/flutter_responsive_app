import 'package:aqsa_solkar_l1_02102022/res/ui_helper.dart';
import 'package:aqsa_solkar_l1_02102022/view/position_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../res/constant.dart';
import '../res/header.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SizedBox(
        width: double.infinity,
        child: Drawer(
            backgroundColor: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(headerList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          itemScrollController.scrollTo(
                              index: index,
                              duration: const Duration(seconds: 1));
                          Navigator.of(context).pop();
                        },
                        child: textWidget(
                            text: headerList[index],
                            textSize: 20,
                            textFontWeight: FontWeight.w600,
                            textColor: Colors.white),
                      ),
                    );
                  }),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                )
              ],
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: logo(),
      ),
      // appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(80.0), // here the desired height
      //     child: Header(
      //       isMobile: true,
      //       headerList: const ['Home', 'Premium', 'Footer'],
      //       onTapHeader: (int index) {
      //         itemScrollController.jumpTo(index: index);
      //       },
      //     )),
      body: PositionScrollableList(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        isMobile: true,
      ),
    );
  }
}
