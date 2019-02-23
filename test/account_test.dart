import 'package:btlb_flutter/src/models/account.dart';
import 'package:test_api/test_api.dart';

main() {
  group('The account model', () {
    test('initializes its name', () {
      Account account = Account(name: 'abc');
      expect(account.name, equals('abc'));
    });
  });
}
