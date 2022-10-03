import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  final Widget child;
  final Animation<Offset> animationOffset;
  const SliderAnimation(
      {Key? key, required this.child, required this.animationOffset})
      : super(key: key);

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // animationController =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // var curved =
    // CurvedAnimation(parent: animationController, curve: Curves.ease);
    // animationOffset =
    //     Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.2))
    //         .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animationOffset,
      child: widget.child,
    );
  }
}
