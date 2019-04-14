import 'package:btlb_flutter/src/models/account.dart';
import 'package:rxdart/rxdart.dart';
import 'package:btlb_network_package/btlb_network_package.dart';
import 'package:btlb_network_package/network.dart';

/// The accounts bloc offers facilities to manage accounts.
/// You can add, retrieve and delete accounts.
class AccountsBloc {
  AccountsBloc()
      : _accounts = BehaviorSubject<Account>(),
        _count = BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<Account> _accounts;
  final BehaviorSubject<int> _count;
  final API api = API(network: Network());

  /// The [AccountsBloc] has accounts which can be observed
  Observable<Account> get accounts => _accounts.distinct();
  Observable<int> get count => _count.distinct();

  /// Add an account
  void addAccount() async {
    Account account = Account(name: "abc");
    var f = await api.authenticate(account.name, account.name);
    if (f == true) {
      _accounts.add(account);
      _count.add(_count.value + 1);
    }
  }
}
