import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:aqsa_solkar_l1_02102022/view/mobile_view.dart';
import 'package:flutter/material.dart';

import '../view/desktop_view.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  const ResponsiveLayout({Key? key, required this.mobileView, required this.tabletView, required this.desktopView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
    {
      if (constraints.maxWidth < mobileWidth) {
        return mobileView;
      }
      else if (constraints.maxWidth > mobileWidth && constraints.maxWidth < tabletWidth ) {
        return tabletView;
      }
      else {
        return desktopView;
      }
    }
    );
  }
}
