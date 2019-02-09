// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:btlb_flutter/src/app.dart';

void main() {
  group('Test App Widget', () {
    testWidgets('has Accounts as initial page', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await tester.pump(Duration.zero);

      expect(find.text('Accounts'), findsNWidgets(3));
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('Tap selects Settings', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await tester.pump(Duration.zero);

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pump();

      expect(find.text('Accounts'), findsOneWidget);
      expect(find.text('Settings'), findsNWidgets(2));
    });
  });
}
