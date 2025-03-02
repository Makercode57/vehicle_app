import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_app/main.dart'; // Replace 'your_app' with your actual app name

void main() {
  testWidgets('Vehicle App test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(VehicleApp()); // Ensure this matches your main app class

    expect(find.text('Vehicle List'), findsOneWidget);
  });
}
