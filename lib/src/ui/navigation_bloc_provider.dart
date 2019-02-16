import 'package:flutter/widgets.dart';
import '../blocs/navigation_bloc.dart';

class NavigationBlocProvider extends InheritedWidget {
  final NavigationBloc navigationBloc;

  NavigationBlocProvider({
    Key key,
    NavigationBloc navigationBloc,
    Widget child,
  })  : navigationBloc = navigationBloc ?? NavigationBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static NavigationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NavigationBlocProvider)
            as NavigationBlocProvider)
        .navigationBloc;
  }
}
