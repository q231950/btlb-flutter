import 'package:btlb_flutter/src/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Accounts page', () {
    MaterialApp app = MaterialApp(theme: ThemeData.light(), home: HomePage());

    testWidgets('has floating action button', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pump(Duration.zero);

      expect(
          find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    });
  });
}
