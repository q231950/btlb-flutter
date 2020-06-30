import 'package:btlb_flutter/src/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('The account model', () {
    test('initializes its name', () {
      Account account = Account(name: 'abc');
      expect(account.name, equals('abc'));
    });
  });
}
