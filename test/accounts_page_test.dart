import 'package:btlb_flutter/src/blocs/accounts_bloc.dart';
import 'package:btlb_flutter/src/blocs/navigation_bloc.dart';
import 'package:btlb_flutter/src/ui/accounts_page.dart';
import 'package:btlb_flutter/src/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AccountsBlocMock extends Mock implements AccountsBloc {}

main() {
  MaterialApp app;
  AccountsBlocMock accountsBlocMock;

  setUp(() {
    accountsBlocMock = AccountsBlocMock();
    AccountsPage page = AccountsPage(bloc: accountsBlocMock);
    NavigationBloc navigationBloc =
        NavigationBloc(pages: [page], selectedIndex: 0);
    app = MaterialApp(
        theme: ThemeData.light(),
        home: HomePage(
          navigationBloc: navigationBloc,
        ));
  });

  group('Accounts page', () {
    testWidgets('adds an account when action button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pump(Duration.zero);

      when(accountsBlocMock.addAccount()).thenAnswer((_) {
        return Future.value();
      });

      await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
      await tester.pump(Duration.zero);

      verify(accountsBlocMock.addAccount()).called(1);
    });

    testWidgets('has floating action button', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pump(Duration.zero);

      expect(
          find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    });
  });
}
