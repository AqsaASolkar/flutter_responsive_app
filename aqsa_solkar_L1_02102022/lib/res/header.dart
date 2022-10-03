import 'package:aqsa_solkar_l1_02102022/res/ui_helper.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isMobile;
  final List<String> headerList;
  final ValueChanged<int>? onTapHeader;
  const Header(
      {Key? key,
      this.headerList = const [],
      this.onTapHeader,
      this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75))
      ], color: Colors.white),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [logo(), navigationList()],
      ),
    );
  }

  Widget navigationList() {
    return isMobile
        ? IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        : ListView.builder(
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
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: headingTitle(header.toString()),
        ),
      ),
    );
  }

  Widget headingTitle(String title) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      const SizedBox(width: 10),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: VerticalDivider(
          color: Colors.black,
          thickness: 1,
        ),
      )
    ]);
  }
}
