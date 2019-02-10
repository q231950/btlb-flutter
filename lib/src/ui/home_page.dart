import 'package:flutter/material.dart';
import 'btlb_bottom_navigation_bar.dart';
import '../blocs/navigation_bloc.dart';
import 'navigation_provider.dart';
import '../mixins/navigatable_page_mixin.dart';

class HomePage extends StatelessWidget {
  HomePage({
    NavigationBloc navigationBloc,
  }) : _navigationBloc = navigationBloc ?? NavigationBloc();

  final NavigationBloc _navigationBloc;

  @override
  Widget build(BuildContext context) {
    return NavigationProvider(
      navigationBloc: _navigationBloc,
      child: Scaffold(
          appBar: _appBar(_navigationBloc),
          body: _body(_navigationBloc),
          floatingActionButton: _floatingActionButton(_navigationBloc),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: BTLBBottomNavigationBar()),
    );
  }

  /// This returns an [AppBar] for a given [NavigationBloc].
  Widget _appBar(NavigationBloc bloc) {
    return AppBar(
      title: StreamBuilder<NavigatablePage>(
        stream: bloc.selectedNavigatablePage,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Text(snapshot.data.title);
            default:
              return Container();
          }
        },
      ),
    );
  }

  /// This returns a body [Widget] for a [NavigationBloc].
  Widget _body(NavigationBloc bloc) {
    return StreamBuilder<Widget>(
      stream: bloc.selectedNavigatablePage,
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
