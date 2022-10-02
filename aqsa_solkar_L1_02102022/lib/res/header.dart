

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String> headerList;
  final ValueChanged<int>? onTapHeader;
  const Header({Key? key, this.headerList = const [], this.onTapHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return buildHeaderList(header: headerList[index], index: index);
      },
      itemCount: headerList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }

  Widget buildHeaderList({String? header, int? index}) {
    return InkWell(
      onTap: () {
        onTapHeader?.call(index!);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: headingTitle(header.toString()),
        ),
      ),
    );
  }

  Widget headingTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}
