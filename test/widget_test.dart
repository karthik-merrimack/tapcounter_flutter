// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:tapcounter_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TapCounterApp());

    // Verify that our counter starts at 0 taps.
    expect(find.text("You've tapped 0 times"), findsOneWidget);
    expect(find.text("You've tapped 1 time"), findsNothing);

    // Tap the 'Tap Me!' button and trigger a frame.
    await tester.tap(find.text('Tap Me!'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text("You've tapped 0 times"), findsNothing);
    expect(find.text("You've tapped 1 time"), findsOneWidget);
  });
}
