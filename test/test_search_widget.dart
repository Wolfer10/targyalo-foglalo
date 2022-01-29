import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:targyalo_foglalo/main.dart';
import 'package:targyalo_foglalo/screens/home.dart';
import 'package:targyalo_foglalo/screens/search.dart';

void main() {
  testWidgets('Should fill datas', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    final Finder numberOfPpl = find.widgetWithText(TextFormField, 'Number of people');
    final Finder submit = find.widgetWithText(ElevatedButton, 'Submit');


    await tester.enterText(numberOfPpl, '1221');


    //await tester.tap(submit);

   // expect(find.text('Meeting rooms'), findsOneWidget);








  });
}
