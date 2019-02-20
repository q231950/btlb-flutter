import 'package:btlb_flutter/src/app.dart';
import 'package:btlb_flutter/src/blocs/navigation_bloc.dart';
import 'package:btlb_flutter/src/ui/home_page.dart';
import 'package:btlb_flutter/src/ui/navigation_bloc_provider.dart';
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
      await tester.pump(Duration.zero);

      await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));

      await tester.pump(Duration.zero);
      expect(find.text('New Account'), findsOneWidget);
    });

    testWidgets('has floating action button', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pump(Duration.zero);

      expect(
          find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    });
  });
}
