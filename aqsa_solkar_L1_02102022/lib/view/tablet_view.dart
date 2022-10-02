import 'package:flutter/material.dart';

import 'footer.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  _TabletViewState createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: MediaQuery.of(context).size.height,
      children: const [
        Text('landing page'),
        Footer(isMobile: true),
      ],
    );
  }
}
