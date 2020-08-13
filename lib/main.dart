import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'src/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  runApp(App());
}
