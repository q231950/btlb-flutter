import 'package:flutter/widgets.dart';
import '../blocs/navigation_bloc.dart';

class NavigationProvider extends InheritedWidget {
  final NavigationBloc navigationBloc;

  NavigationProvider({
    Key key,
    NavigationBloc navigationBloc,
    Widget child,
  })  : navigationBloc = navigationBloc ?? NavigationBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static NavigationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NavigationProvider)
            as NavigationProvider)
        .navigationBloc;
  }
}
