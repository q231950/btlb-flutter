import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../mixins/titled_page_mixin.dart';
import '../blocs/settings_bloc.dart';
import '../models/settings.dart';

class SettingsPage extends StatelessWidget with TitledPage {
  SettingsPage({this.bloc}): super();

  final SettingsBloc bloc;
  final String title = 'Settings';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Settings>(
      stream: bloc.settings,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            themeWidget(snapshot.data)
          ],
        );
      },
      );
  }

  Widget themeWidget(Settings settings) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
          value: ThemeSelection.light,
          groupValue: settings.themeSelection,
          onChanged: (themeSelection) => didSelectTheme(themeSelection),
        ),
        Text('Light Theme')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
          value: ThemeSelection.dark,
          groupValue: settings.themeSelection,
          onChanged: (themeSelection) => didSelectTheme(themeSelection),
        ),
        Text('Dark Theme'),
          ],
        )
      ],
    );
  }

  void didSelectTheme(ThemeSelection selection) {
    bloc.selectTheme(selection);
  }
}
