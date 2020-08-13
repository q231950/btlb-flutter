import 'package:btlb_flutter/src/blocs/accounts_bloc.dart';
import 'package:btlb_flutter/src/models/account.dart';
import 'package:btlb_flutter/src/ui/accounts_bloc_provider.dart';
import 'package:btlb_flutter/src/ui/create_account_page.dart';
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
    AccountsBloc accountsBloc = AccountsBlocProvider.of(context);
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute<int>(
            builder: (BuildContext context) {
              return CreateAccountPage(accountsBloc);
            },
            fullscreenDialog: true));
      },
      child: Icon(Icons.add),
    );
  }

  @override
  State<StatefulWidget> createState() => AccountsPageState();
}

class AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    AccountsBloc bloc = AccountsBlocProvider.of(context);
    return StreamBuilder<int>(
        stream: bloc.count,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                itemCount: snapshot.data,
                itemBuilder: _itemBuilder,
              );
            default:
              return Container();
          }
        });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    AccountsBloc bloc = AccountsBlocProvider.of(context);
    Account account = bloc.accounts[index];
    String name = account.name;
    return ListTile(title: Text("$index $name"));
  }
}
