import 'package:flutter/material.dart';
import 'btlb_bottom_navigation_bar.dart';
import '../blocs/navigation_bloc.dart';
import '../blocs/settings_bloc.dart';
import 'navigation_provider.dart';
import 'accounts_page.dart';
import 'settings_page.dart';
import '../mixins/navigatable_page_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final widgets = <NavigatablePage>[
    AccountsPage(),
    SettingsPage(bloc: SettingsBloc())
  ];
  static final NavigationBloc _navigationBloc =
      NavigationBloc(selectedIndex: 0, widgets: widgets);

  @override
  Widget build(BuildContext context) {
    return NavigationProvider(
      navigationBloc: _navigationBloc,
      child: Scaffold(
          floatingActionButton: _floatingActionButton(_navigationBloc),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            title: StreamBuilder<NavigatablePage>(
              stream: _navigationBloc.selectedNavigatablePage,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return Text(snapshot.data.title);
                  default:
                    return Container();
                }
              },
            ),
          ),
          body: StreamBuilder<Widget>(
            stream: _navigationBloc.selectedNavigatablePage,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return Center(
                    child: snapshot.data,
                  );
                default:
                  return Container();
              }
            },
          ),
          bottomNavigationBar: BTLBBottomNavigationBar()),
    );
  }

  /// Returns a [FloatingActionButton] for a given [NavigationBloc].
  Widget _floatingActionButton(NavigationBloc bloc) {
    return StreamBuilder<NavigatablePage>(
      stream: bloc.selectedNavigatablePage,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return snapshot.data.actionButton;
          default:
            return Container();
        }
      },
    );
  }
}
