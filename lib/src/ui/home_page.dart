import 'package:flutter/material.dart';
import 'btlb_bottom_navigation_bar.dart';
import '../blocs/navigation_bloc.dart';
import 'navigation_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NavigationBloc _navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return NavigationProvider(
      navigationBloc: _navigationBloc,
      child: StreamBuilder<int>(
          stream: _navigationBloc.selectedIndex,
          builder: (context, snapshot) => Scaffold(
                appBar: AppBar(
                  title: Text('BTLB'),
                ),
                body: Text('data'),
                bottomNavigationBar: BTLBBottomNavigationBar(children: []),
              )),
    );
  }
}
