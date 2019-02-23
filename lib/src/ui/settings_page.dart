import 'package:btlb_flutter/src/blocs/generic_bloc_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../mixins/navigatable_page_mixin.dart';
import '../blocs/settings_bloc.dart';
import '../models/settings.dart';

class SettingsPage extends StatelessWidget with NavigatablePage {
  final String title = 'Settings';

  @override
  Widget build(BuildContext context) {
    SettingsBloc bloc = GenericBlocProvider.of<SettingsBloc>(context);
    return StreamBuilder<Settings>(
      stream: bloc.settings,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return Column(
              children: <Widget>[themeWidget(snapshot.data, context)],
            );
          default:
            return Container();
        }
      },
    );
  }

  Widget themeWidget(Settings settings, BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: ThemeSelection.light,
              groupValue: settings.themeSelection,
              onChanged: (themeSelection) =>
                  didSelectTheme(themeSelection, context),
            ),
            Text('Light Theme')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: ThemeSelection.dark,
              groupValue: settings.themeSelection,
              onChanged: (themeSelection) =>
                  didSelectTheme(themeSelection, context),
            ),
            Text('Dark Theme'),
          ],
        )
      ],
    );
  }

  void didSelectTheme(ThemeSelection selection, BuildContext context) {
    SettingsBloc bloc = GenericBlocProvider.of<SettingsBloc>(context);
    bloc.selectTheme(selection);
  }
}
