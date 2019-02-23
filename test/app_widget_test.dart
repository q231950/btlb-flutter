import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:btlb_flutter/src/app.dart';

void main() {
  group('App widget', () {
    testWidgets('has accounts page as initial page',
        (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await tester.pump();

      expect(find.text('Accounts'), findsNWidgets(2));
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('tap selects settings page', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pump();

      expect(find.text('Accounts'), findsOneWidget);
      expect(find.text('Settings'), findsNWidgets(2));
    });
  });
}
