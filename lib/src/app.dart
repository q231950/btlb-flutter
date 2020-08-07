import 'package:btlb_flutter/src/blocs/navigation_bloc.dart';
import 'package:btlb_flutter/src/blocs/settings_bloc.dart';
import 'package:btlb_flutter/src/blocs/generic_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/account_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: _homePage(),
      routes: {AccountPage.routeName: (context) => AccountPage()},
    );
  }

  /// This is the [HomePage] of the app.
  Widget _homePage() {
    NavigationBloc navigationBloc =
        NavigationBloc(selection: NavigationSelection.Accounts);

    var settingsProvider = GenericBlocProvider<SettingsBloc>(
      navigationBloc: SettingsBloc(),
      child: HomePage(),
    );

    return GenericBlocProvider<NavigationBloc>(
        navigationBloc: navigationBloc, child: settingsProvider);
  }
}
