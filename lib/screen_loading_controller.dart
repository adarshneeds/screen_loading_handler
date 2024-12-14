import 'package:flutter/foundation.dart';

/// The [ScreenLoadingController] manages the loading state using a [ValueNotifier].
/// It provides methods to start and stop the loading process, which is listened to
/// by other widgets to display or hide the loading indicator.
class ScreenLoadingController {
  // A private ValueNotifier that holds the loading state (true or false).
  // It allows the UI to reactively update when the loading state changes.
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  /// A getter to access the current loading state.
  /// Returns true if the loading indicator is active, false otherwise.
  ValueNotifier<bool> get isLoading => _isLoading;

  /// Starts the loading process by setting the loading state to true.
  /// This triggers the display of the loading indicator in the UI.
  void startLoading() => _isLoading.value = true;

  /// Stops the loading process by setting the loading state to false.
  /// This removes the loading indicator from the UI.
  void stopLoading() => _isLoading.value = false;
}
