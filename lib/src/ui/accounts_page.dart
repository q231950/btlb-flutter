import 'package:flutter/widgets.dart';
import '../mixins/navigatable_page_mixin.dart';
import 'package:flutter/material.dart';

// The Accounts page shows a list of accounts.
// Accounts can be added by pressing a action
class AccountsPage extends StatelessWidget with NavigatablePage {
  final String title = 'Accounts';

  @override
  Widget get actionButton {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
