


import 'package:flutter/material.dart';

extension MediaQuaryValues on BuildContext{
  double get height => MediaQuery.of(this).size.height;
  double get weight => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewInsets.top;
  double get bottomPadding => MediaQuery.of(this).viewInsets.bottom;
}