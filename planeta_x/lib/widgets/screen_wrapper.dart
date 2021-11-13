import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;

  ScreenWrapper({required this.child}): assert(child!=null);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height-80;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: height,
          width: width
        ),
        child: Padding(
          padding:const EdgeInsets.only(left:20,right:20),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}