import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  final Widget child;
  final Function? onTap;
  //final Animation<Offset> animationOffset;
  const SliderAnimation({Key? key, required this.child, this.onTap})
      : super(key: key);

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Animation<Offset>? animationOffset;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    var curved =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
    animationOffset =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.2))
            .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onTap?.call();
        },
        onHover: (isHover) {
          {
            if (isHover) {
              setState(() {
                animationController.forward();
              });
            } else {
              setState(() {
                animationController.reverse();
              });
            }
          }
        },
        child: SlideTransition(
          position: animationOffset!,
          child: widget.child,
        ));
  }
}
