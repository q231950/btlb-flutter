import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

mixin NavigatablePage on Widget {
  /// This is the title of a [NavigatablePage].
  /// It defaults to an empty [String] when not overwritten.
  String get title => "";

  /// You can provide a [FloatingActionButton] in any [NavigatablePage].
  /// If you choose to do so, overwrite this getter. Not overwriting this
  /// method will lead to an empty [Container] as [FloatingActionButton] as a default.
  Widget get actionButton => Container();
}
