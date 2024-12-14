import 'package:flutter/material.dart';
import 'package:screen_loading_handler/screen_loading_controller.dart';

/// The [ScreenLoadingHandler] widget displays a loading box (spinner) over
/// the body of the screen when the loading state is triggered.
/// It listens to a [ScreenLoadingController] which manages the loading state
/// using a [ValueNotifier]. The widget will automatically rebuild and display
/// the loading indicator without requiring manual calls to [setState].
///
/// This is an efficient solution for managing loading states throughout the app
/// in a way that is decoupled from other app logic. The loading indicator is
/// displayed by updating the [ValueNotifier] value in the controller, triggering
/// a reactive UI update when the loading state changes. No explicit state management
/// is needed in the widget itself.
class ScreenLoadingHandler extends StatelessWidget {
  /// Constructor that initializes the widget with required and optional parameters.
  /// The parameters allow customization of the loading indicator's appearance and behavior.
  const ScreenLoadingHandler({
    required this.controller, // The controller that manages the loading state
    required this.child, // The main body (UI content) of the screen
    this.backgroundColor =
        Colors.white10, // Background color for the loading overlay
    this.loadingBoxColor = Colors.black, // Box color for the loading spinner
    this.loadingIndicatorColor = Colors.white, // Color of the loading indicator
    this.loadingBoxHeight = 90, // Height of the loading box
    this.loadingBoxWidth = 90, // Width of the loading box
    this.loadingBoxBorderRadius = 18, // Border radius of the loading box
    this.loadingIndicatorStrokeWidth = 3, // Thickness of the loading indicator
    this.closeOnTap = false, // Close the loading overlay on tap
    super.key,
  });

  // The controller that manages the loading state.
  final ScreenLoadingController controller;

  // The main body of the screen (typically a widget that takes up the entire screen).
  final Widget child;

  // The background color of the loading overlay (default is a transparent white).
  final Color backgroundColor;

  // The color of the box around the loading indicator (default is black).
  final Color loadingBoxColor;

  // The color of the loading indicator itself (default is white).
  final Color loadingIndicatorColor;

  // The stroke width of the loading indicator.
  final double loadingIndicatorStrokeWidth;

  // Height of the loading box.
  final double loadingBoxHeight;

  // Width of the loading box.
  final double loadingBoxWidth;

  // Border radius of the loading box.
  final double loadingBoxBorderRadius;

  // If true, the loading indicator can be closed by tapping on the overlay.
  final bool closeOnTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The body of the screen (the main content of the UI).
        // This widget will be displayed below the loading indicator.
        child,

        // ValueListenableBuilder listens to changes in the loading state
        // (the value of [controller._isLoading]) and rebuilds the UI when
        // the state changes. This allows the loading indicator to appear or disappear.
        ValueListenableBuilder<bool>(
          valueListenable: controller.isLoading, // Listen to the loading state
          builder: (context, value, _) {
            // If loading is false, we return an empty widget to hide the overlay.
            if (!value) return const SizedBox.shrink();

            // If loading is true, we return a full-screen overlay with the loading indicator.
            return GestureDetector(
              onTap: () {
                // If closeOnTap is true, stop the loading process when the overlay is tapped.
                if (closeOnTap) controller.stopLoading();
              },
              child: Container(
                // Make the container take up the full screen
                height: double.infinity,
                width: double.infinity,
                color:
                    backgroundColor, // Set the background color for the overlay
                child: Center(
                  // Center the loading indicator in the middle of the screen
                  child: Container(
                    height:
                        loadingBoxHeight, // Set a fixed height for the loading box
                    width:
                        loadingBoxWidth, // Set a fixed width for the loading box
                    decoration: BoxDecoration(
                      color:
                          loadingBoxColor, // Set the color of the box around the spinner
                      borderRadius: BorderRadius.circular(
                          loadingBoxBorderRadius), // Rounded corners for the box
                    ),
                    child: Center(
                      // Center the CircularProgressIndicator inside the loading box
                      child: CircularProgressIndicator(
                        color:
                            loadingIndicatorColor, // Set the color of the spinner
                        strokeWidth:
                            loadingIndicatorStrokeWidth, // Set the thickness of the spinner's stroke
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
