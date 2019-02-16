import 'package:btlb_flutter/src/blocs/accounts_bloc.dart';
import 'package:btlb_flutter/src/ui/accounts_bloc_provider.dart';
import 'package:flutter/widgets.dart';
import '../mixins/navigatable_page_mixin.dart';
import 'package:flutter/material.dart';

// The Accounts page shows a list of accounts.
// Accounts can be added by pressing a action
class AccountsPage extends StatefulWidget with NavigatablePage {
  @override
  final String title = 'Accounts';

  /// The action button of the [AccountsPage] adds accounts to the [AccountsBloc].
  @override
  Widget actionButton(BuildContext context) {
    AccountsBloc bloc = AccountsBlocProvider.of(context);
    return FloatingActionButton(
      onPressed: () {
        bloc.addAccount();
      },
      child: Icon(Icons.add),
    );
  }

  @override
  State<StatefulWidget> createState() => AccountsPageState();
}

class AccountsPageState extends State<AccountsPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    AccountsBloc bloc = AccountsBlocProvider.of(context);
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("entry $index"));
      },
    );
  }
}
