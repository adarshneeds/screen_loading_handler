import 'package:flutter_test/flutter_test.dart';
import 'package:screen_loading_handler/screen_loading_controller.dart';

void main() {
  group('ScreenLoadingController', () {
    late ScreenLoadingController controller;

    // Set up the controller before each test
    setUp(() {
      controller = ScreenLoadingController();
    });

    test('should start loading correctly', () {
      // Ensure the initial loading state is false
      expect(controller.isLoading.value, isFalse);

      // Start loading and verify the state changes to true
      controller.startLoading();
      expect(controller.isLoading.value, isTrue);
    });

    test('should stop loading correctly', () {
      // Ensure the initial loading state is false
      expect(controller.isLoading.value, isFalse);

      // Start loading
      controller.startLoading();
      expect(controller.isLoading.value, isTrue);

      // Stop loading and verify the state changes to false
      controller.stopLoading();
      expect(controller.isLoading.value, isFalse);
    });

    test('should not change loading state if already in desired state', () {
      // Start loading and verify state is true
      controller.startLoading();
      expect(controller.isLoading.value, isTrue);

      // Try starting loading again (state should remain true)
      controller.startLoading();
      expect(controller.isLoading.value, isTrue);

      // Stop loading and verify state is false
      controller.stopLoading();
      expect(controller.isLoading.value, isFalse);

      // Try stopping loading again (state should remain false)
      controller.stopLoading();
      expect(controller.isLoading.value, isFalse);
    });
  });
}
