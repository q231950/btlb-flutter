import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/account_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: { AccountPage.routeName: (context) => AccountPage() },
    );
  }
}
