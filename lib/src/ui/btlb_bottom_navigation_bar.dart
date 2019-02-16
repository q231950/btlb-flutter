import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'navigation_bloc_provider.dart';
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
    NavigationBloc navigationBloc = NavigationBlocProvider.of(context);
    return StreamBuilder<int>(
      stream: navigationBloc.selectedIndex,
      initialData: 0,
      builder: (context, snapshot) => BottomNavigationBar(
            currentIndex: snapshot.data,
            items: items,
            onTap: (selectedIndex) => _onTabTapped(selectedIndex, context),
          ),
    );
  }

  void _onTabTapped(int index, BuildContext context) {
    NavigationBloc navigationBloc = NavigationBlocProvider.of(context);
    navigationBloc.setSelectedIndex(index);
  }
}
