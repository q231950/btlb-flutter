import 'package:btlb_flutter/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  App app;

  setUp(() {
    app = App();
  });

  group('Accounts page', () {
    testWidgets('show account creation page when action button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pump();

      await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));

      // `pumpAndSettle` only waits when `flutter run test.dart`. In the `flutter test test.dart` case it will return as soon as there is nothing left to `pump`.
      await tester.pumpAndSettle();

      expect(find.text('New Account'), findsOneWidget);
    });

    testWidgets('has floating action button', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pump();

      expect(
          find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    });
  });
}
