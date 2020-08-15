import 'package:btlb_flutter/src/models/account.dart';
import 'package:btlb_flutter/src/models/accounts.model.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

import 'package:hive_flutter/hive_flutter.dart';

/// The accounts bloc offers facilities to manage accounts.
/// You can add, retrieve and delete accounts.
class AccountsBloc {
  AccountsBloc()
      : accounts = List<Account>(),
        _count = BehaviorSubject<int>(seedValue: 0) {
    Hive.initFlutter().then((value) {
      Hive.registerAdapter(AccountAdapter());
      Hive.registerAdapter(AccountsModelAdapter());
      Hive.openBox("accountsBox").then((box) {
        var accounts = box.toMap().values.toList();
        accounts.forEach((element) {
          Account account = element;
          accounts.add(account);
          _count.add(_count.value + 1);
        });
      });
    });
  }

  final List<Account> accounts;
  final BehaviorSubject<int> _count;

  /// The [AccountsBloc] has accounts which can be observed
  Observable<int> get count => _count;

  /// Add an account
  void addAccount(String name) async {
    Account account = Account(name);
    var box = await Hive.openBox("accountsBox");

    box.add(account);
    // account.save();

    accounts.add(account);
    _count.add(_count.value + 1);

    print("add account");
  }
}
