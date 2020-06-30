import 'package:flutter/widgets.dart'
    show BuildContext, InheritedWidget, Key, Widget;

class GenericBlocProvider<T> extends InheritedWidget {
  final T navigationBloc;

  GenericBlocProvider({
    Key key,
    T navigationBloc,
    Widget child,
  })  : navigationBloc = navigationBloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static T of<T>(BuildContext context) {
    GenericBlocProvider<T> blocProvider = context
        .getElementForInheritedWidgetOfExactType<GenericBlocProvider<T>>()
        ?.widget;
    return blocProvider?.navigationBloc;
  }
}
