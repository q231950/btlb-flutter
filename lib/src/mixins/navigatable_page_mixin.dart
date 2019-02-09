import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

mixin NavigatablePage on Widget {
  String get title;
  Widget get actionButton;
}
