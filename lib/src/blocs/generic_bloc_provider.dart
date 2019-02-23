import 'package:flutter/widgets.dart';

Type _typeOf<T>() => T;

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
    final type = _typeOf<GenericBlocProvider<T>>();
    GenericBlocProvider<T> blocProvider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return blocProvider?.navigationBloc;
  }
}
