import 'package:btlb_flutter/src/ui/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Create Account Page', () {
    testWidgets('has create button', (WidgetTester tester) async {
      var accountPage = MaterialApp(
        home: CreateAccountPage(),
      );
      await tester.pumpWidget(accountPage);
      await tester.pump(Duration.zero);

      expect(find.text('New Account'), findsOneWidget);
    });
  });
}
