import 'package:btlb_flutter/src/blocs/navigation_bloc.dart';
import 'package:btlb_flutter/src/ui/navigation_bloc_provider.dart';
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
    NavigationBloc navigationBloc = NavigationBloc(selectedIndex: 0);

    return NavigationBlocProvider(
        navigationBloc: navigationBloc, child: HomePage());
  }
}
