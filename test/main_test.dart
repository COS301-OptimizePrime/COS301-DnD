import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/login_page.dart';
import 'package:dnd_301_final/home_page.dart';
import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/monster_journal.dart';

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

  // Tests Menu Drawer when it is open and closed
  testWidgets('Login Test', (WidgetTester tester) async {
    StatefulWidget login = new LoginPage();

    final routes = <String, WidgetBuilder>{
      LoginPage.tag: (context) => new LoginPage(),
      HomePage.tag: (context) => new HomePage(),
      MonsterJournal.tag: (context) => new MonsterJournal(),
      CharacterSelection.tag: (context) => new CharacterSelection()
    };

    // set up environment
    await tester.pumpWidget(
        new MaterialApp(
            home: login,
            routes: routes,
        )
    );

    // check if page is loaded correctly
    expect(find.byType(Hero), findsOneWidget);
    expect(find.text('spongebob@cos123.com'), findsOneWidget);
    expect(find.text('qwerty'), findsOneWidget);
    expect(find.text('Enter World!'), findsOneWidget);
    expect(find.text('Google Sign In!'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);

    // log in
    await tester.tap(find.text('Enter World!'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 5));

    //expect(find.text('Join Game Session'), findsOneWidget);
  });
}