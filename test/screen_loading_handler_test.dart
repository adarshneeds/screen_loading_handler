import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_loading_handler/screen_loading_controller.dart'; // Adjust the import according to your project structure
import 'package:screen_loading_handler/screen_loading_handler.dart';

void main() {
  group('ScreenLoadingHandler', () {
    late ScreenLoadingController controller;

    // Set up the controller before each test
    setUp(() {
      controller = ScreenLoadingController();
    });

    testWidgets('should show loading indicator when isLoading is true',
        (WidgetTester tester) async {
      // Build the widget tree with ScreenLoadingHandler
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenLoadingHandler(
            controller: controller,
            child: const SizedBox.shrink(), // Empty child for testing purposes
          ),
        ),
      );

      // Initially, the loading indicator should not be visible
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // Start loading by calling startLoading
      controller.startLoading();
      await tester.pump(); // Rebuild the widget tree

      // The loading indicator should now be visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should hide loading indicator when isLoading is false',
        (WidgetTester tester) async {
      // Build the widget tree with ScreenLoadingHandler
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenLoadingHandler(
            controller: controller,
            child: const SizedBox.shrink(),
          ),
        ),
      );

      // Start loading to show the indicator
      controller.startLoading();
      await tester.pump();

      // Ensure the loading indicator is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Stop loading and ensure the indicator is hidden
      controller.stopLoading();
      await tester.pump();

      // The loading indicator should be hidden now
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets(
        'should close loading indicator when tapped if closeOnTap is true',
        (WidgetTester tester) async {
      // Build the widget tree with ScreenLoadingHandler and closeOnTap set to true
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenLoadingHandler(
            controller: controller,
            closeOnTap: true,
            child: const SizedBox.shrink(),
          ),
        ),
      );

      // Start loading to show the indicator
      controller.startLoading();
      await tester.pump();

      // Ensure the loading indicator is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Tap on the loading overlay to close the indicator
      await tester.tap(find.byType(GestureDetector));
      await tester.pump(); // Rebuild the widget tree

      // The loading indicator should be hidden after tap
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets(
        'should not close loading indicator when tapped if closeOnTap is false',
        (WidgetTester tester) async {
      // Build the widget tree with ScreenLoadingHandler and closeOnTap set to false
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenLoadingHandler(
            controller: controller,
            closeOnTap: false,
            child: const SizedBox.shrink(),
          ),
        ),
      );

      // Start loading to show the indicator
      controller.startLoading();
      await tester.pump();

      // Ensure the loading indicator is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Tap on the loading overlay (but the loading indicator should not close)
      await tester.tap(find.byType(GestureDetector));
      await tester.pump(); // Rebuild the widget tree

      // The loading indicator should still be visible because closeOnTap is false
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
