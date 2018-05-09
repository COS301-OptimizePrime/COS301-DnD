import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dnd_301_final/menu.dart';

main() {
  // Tests Menu Drawer when it is open and closed
  testWidgets('Menu Drawer Open/Closed Test', (WidgetTester tester) async {

    // set up environment
    await tester.pumpWidget(
        new MaterialApp(
            home: new Scaffold(
              drawer: new Menu()
            )
        )
    );

    // not open
    expect(find.text('D&D Game State Manager'), findsNothing);
    expect(find.text('Home Page'), findsNothing);
    expect(find.text('Character Selection'), findsNothing);
    expect(find.text('Monster Journal'), findsNothing);
    expect(find.text('Sign Out'), findsNothing);

    final ScaffoldState state = tester.firstState(find.byType(Scaffold));

    state.openDrawer();
    await tester.pump();

    // open
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('D&D Game State Manager'), findsOneWidget);
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Character Selection'), findsOneWidget);
    expect(find.text('Monster Journal'), findsOneWidget);
    expect(find.text('Sign Out'), findsOneWidget);
  });
}