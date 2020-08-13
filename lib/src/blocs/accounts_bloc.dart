import 'package:btlb_flutter/src/models/account.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

/// The accounts bloc offers facilities to manage accounts.
/// You can add, retrieve and delete accounts.
class AccountsBloc {
  AccountsBloc()
      : accounts = List<Account>(),
        _count = BehaviorSubject<int>(seedValue: 0) {
    loadAccounts().then((value) {
      Account account = Account(name: value);
      accounts.add(account);
      _count.add(_count.value + 1);
    });
  }

  final List<Account> accounts;
  final BehaviorSubject<int> _count;

  /// The [AccountsBloc] has accounts which can be observed
  Observable<int> get count => _count;

  /// Add an account
  void addAccount(String name) async {
    Account account = Account(name: name);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('account', name);

    accounts.add(account);
    _count.add(_count.value + 1);

    print("add account");
  }

  Future<String> loadAccounts() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString('account') ?? "xxx");
  }
}
