import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aqsa_solkar_l1_02102022/Responsive/responsive_layout.dart';
import 'package:aqsa_solkar_l1_02102022/view/desktop_view.dart';
import 'package:aqsa_solkar_l1_02102022/view/mobile_view.dart';
import 'package:aqsa_solkar_l1_02102022/view/tablet_view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: AnimatedSplashScreen(
            splash: 'images/loadcoffee.gif',
            duration: 3000,
            nextScreen: const ResponsiveLayout(
                desktopView: DeskTopView(),
                tabletView: TabletView(),
                mobileView: MobileView()),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white));
    // ResponsiveLayout(
    //     desktopView: DeskTopView(),
    //     tabletView: TabletView(),
    //     mobileView: MobileView()));
  }
}
