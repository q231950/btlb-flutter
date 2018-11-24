import 'package:flutter/widgets.dart';
import '../mixins/titled_page_mixin.dart';

class SettingsPage extends StatelessWidget with TitledPage {

  final String title = 'Settings';
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
