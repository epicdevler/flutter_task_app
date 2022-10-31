import 'package:flutter/material.dart';

class Aligner extends StatelessWidget {
  Axis? direction = Axis.vertical;
  final List<Widget> children;
  Aligner({Key? key, this.direction, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
  }
}
