import 'package:flutter/widgets.dart';
import '../mixins/titled_page_mixin.dart';

class AccountsPage extends StatelessWidget with TitledPage {
  
  final String title = 'Accounts';

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
