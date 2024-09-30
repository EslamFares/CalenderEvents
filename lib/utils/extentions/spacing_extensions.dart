import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

//==================
SizedBox gapVertical(double height) => SizedBox(height: height);
SizedBox gapHorizontal(double width) => SizedBox(width: width);
Widget gapExpanded() => const Expanded(child: SizedBox());
