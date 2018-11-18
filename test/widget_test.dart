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
  testWidgets('Tap selects Settings smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that we are on the accounts screen and see the Settings bottom navigation entry.
    expect(find.text('Accounts'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Accounts'), findsOneWidget);
    expect(find.text('Settings'), findsNWidgets(3));
  });
}
