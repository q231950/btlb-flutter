import 'package:btlb_flutter/src/blocs/accounts_bloc.dart';
import 'package:flutter/widgets.dart';
import '../mixins/navigatable_page_mixin.dart';
import 'package:flutter/material.dart';

// The Accounts page shows a list of accounts.
// Accounts can be added by pressing a action
class AccountsPage extends StatelessWidget with NavigatablePage {
  AccountsPage({
    AccountsBloc bloc,
  }) : _bloc = bloc ?? AccountsBloc();

  final AccountsBloc _bloc;

  @override
  final String title = 'Accounts';

  /// The action button of the [AccountsPage] adds accounts to the [AccountsBloc].
  @override
  Widget get actionButton {
    return FloatingActionButton(
      onPressed: () {
        _bloc.addAccount();
      },
      child: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
