import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'generic_bloc_provider.dart';
import '../blocs/navigation_bloc.dart';

class BTLBBottomNavigationBar extends StatefulWidget {
  @override
  _BTLBBottomNavigationBarState createState() =>
      _BTLBBottomNavigationBarState();
}

class _BTLBBottomNavigationBarState extends State<BTLBBottomNavigationBar> {
  final List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        title: Text('Accounts'), icon: Icon(Icons.supervised_user_circle)),
    BottomNavigationBarItem(title: Text('Settings'), icon: Icon(Icons.settings))
  ];

  @override
  Widget build(BuildContext context) {
    NavigationBloc navigationBloc =
        GenericBlocProvider.of<NavigationBloc>(context);
    return StreamBuilder<NavigationSelection>(
      stream: navigationBloc.selection,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return BottomNavigationBar(
              currentIndex: snapshot.data.index,
              items: items,
              onTap: (selectedIndex) => _onTabTapped(selectedIndex, context),
            );
          default:
            return Container();
        }
      },
    );
  }

  void _onTabTapped(int index, BuildContext context) {
    NavigationBloc navigationBloc =
        GenericBlocProvider.of<NavigationBloc>(context);
    navigationBloc.setSelection(NavigationSelection.values[index]);
  }
}
