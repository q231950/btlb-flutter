import 'package:btlb_flutter/src/blocs/navigation_bloc.dart';
import 'package:btlb_flutter/src/blocs/settings_bloc.dart';
import 'package:btlb_flutter/src/ui/accounts_page.dart';
import 'package:btlb_flutter/src/mixins/navigatable_page_mixin.dart';
import 'package:btlb_flutter/src/ui/settings_page.dart';
import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/account_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: _homePage(),
      routes: {AccountPage.routeName: (context) => AccountPage()},
    );
  }

  /// This is the [HomePage] of the app.
  Widget _homePage() {
    List<NavigatablePage> navigatablePages = <NavigatablePage>[
      AccountsPage(),
      SettingsPage(bloc: SettingsBloc())
    ];

    NavigationBloc navigationBloc =
        NavigationBloc(pages: navigatablePages, selectedIndex: 0);

    return HomePage(
      navigationBloc: navigationBloc,
    );
  }
}
