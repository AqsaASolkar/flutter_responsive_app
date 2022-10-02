import 'package:flutter/material.dart';

import 'coffee_logos.dart';
import 'footer.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: MediaQuery.of(context).size.height,
      children: const [
        Text('landing page'),
        CoffeeLogos(),
        Footer(isMobile: true),
      ],
    );
  }
}
