import 'package:flutter/material.dart';
import 'btlb_bottom_navigation_bar.dart';
import '../blocs/navigation_bloc.dart';
import 'navigation_provider.dart';
import 'accounts_page.dart';
import 'bloc_account_page.dart';
import 'settings_page.dart';
import '../mixins/titled_page_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final widgets = <TitledPage>[AccountsPage(), SettingsPage()];
  final NavigationBloc _navigationBloc =
      NavigationBloc(selectedIndex: 0, widgets: widgets);

  @override
  Widget build(BuildContext context) {
    return NavigationProvider(
        navigationBloc: _navigationBloc,
        child: Scaffold(
          appBar: AppBar(
            title: StreamBuilder<TitledPage>(
              stream: _navigationBloc.selectedWidget,
              builder: (context, snapshot) => Text(snapshot.data.title),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.person_add),
                onPressed: () {
                  Navigator.of(context).pushNamed(BlocAccountPage.routeName);
                },
              )
            ],
          ),
          body: StreamBuilder<TitledPage>(
            stream: _navigationBloc.selectedWidget,
            builder: (context, snapshot) => Center(
                  child: snapshot.data,
                ),
          ),
          bottomNavigationBar: StreamBuilder<int>(
            stream: _navigationBloc.selectedIndex,
            builder: (context, snapshot) => BTLBBottomNavigationBar(),
          ),
        ));
  }
}
