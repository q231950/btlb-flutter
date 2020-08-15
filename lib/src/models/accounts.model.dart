import 'package:hive/hive.dart';
import 'account.dart';

part 'accounts.model.g.dart';

@HiveType(typeId: 1)
class AccountsModel extends HiveObject {
  @HiveField(0)
  List<Account> accounts;
}
