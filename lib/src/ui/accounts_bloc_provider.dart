import 'package:btlb_flutter/src/blocs/accounts_bloc.dart';
import 'package:flutter/widgets.dart';

class AccountsBlocProvider extends InheritedWidget {
  final AccountsBloc accountsBloc;

  AccountsBlocProvider({Key key, AccountsBloc accountsBloc, Widget child})
      : accountsBloc = accountsBloc ?? AccountsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AccountsBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AccountsBlocProvider>()
        .accountsBloc;
  }
}
