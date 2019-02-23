import 'package:btlb_flutter/src/blocs/accounts_bloc.dart';
import 'package:btlb_flutter/src/ui/accounts_bloc_provider.dart';
import 'package:btlb_flutter/src/ui/accounts_page.dart';
import 'package:btlb_flutter/src/ui/settings_page.dart';
import 'package:flutter/material.dart';
import 'btlb_bottom_navigation_bar.dart';
import '../blocs/navigation_bloc.dart';
import 'generic_bloc_provider.dart';
import '../mixins/navigatable_page_mixin.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState() : pages = [AccountsPage(), SettingsPage()];

  final List<NavigatablePage> pages;

  @override
  Widget build(BuildContext context) {
    NavigationBloc navigationBloc =
        GenericBlocProvider.of<NavigationBloc>(context);
    return AccountsBlocProvider(
        accountsBloc: AccountsBloc(),
        child: Scaffold(
            appBar: _appBar(navigationBloc),
            body: _body(navigationBloc),
            floatingActionButton:
                _floatingActionButton(context, navigationBloc),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            bottomNavigationBar: BTLBBottomNavigationBar()));
  }

  /// This returns an [AppBar] for a given [NavigationBloc].
  Widget _appBar(NavigationBloc bloc) {
    return AppBar(
      title: StreamBuilder<NavigationSelection>(
        stream: bloc.selection,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Text(pages[snapshot.data.index].title);
            default:
              return Container();
          }
        },
      ),
    );
  }

  /// This returns a body [Widget] for a [NavigationBloc].
  Widget _body(NavigationBloc bloc) {
    return StreamBuilder<NavigationSelection>(
      stream: bloc.selection,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return Center(
              child: pages[snapshot.data.index],
            );
          default:
            return Container();
        }
      },
    );
  }

  /// Returns a [FloatingActionButton] for a given [NavigationBloc].
  Widget _floatingActionButton(BuildContext context, NavigationBloc bloc) {
    return StreamBuilder<NavigationSelection>(
      stream: bloc.selection,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return pages[snapshot.data.index].actionButton(context);
          default:
            return Container();
        }
      },
    );
  }
}
