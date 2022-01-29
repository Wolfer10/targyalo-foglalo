// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:targyalo_foglalo/main.dart';
import 'package:targyalo_foglalo/screens/home.dart';

void main() {
  testWidgets('Should find Meeting Rooms text', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyApp());
    expect(find.text('Meeting Rooms.'), findsOneWidget);
  });

  testWidgets('Should click Button and switch to Search', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    expect(find.text('Search'), findsOneWidget);
  });
}
