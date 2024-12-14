# Example: ScreenLoadingHandler

This example demonstrates how to use the `ScreenLoadingHandler` widget in your Flutter application. The `ScreenLoadingHandler` provides an elegant way to display a loading overlay over your screen's content.

---

## Features
- Display a customizable loading overlay.
- Manage loading state reactively with a `ScreenLoadingController`.
- Optional dismiss-on-tap functionality for the loading overlay.

---

## Code Example

```dart
import 'package:flutter/material.dart';
import 'package:screen_loading_handler/screen_loading_controller.dart';
import 'package:screen_loading_handler/screen_loading_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Loading Handler Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize the ScreenLoadingController
  final ScreenLoadingController _loadingController = ScreenLoadingController();

  // Simulate a network call
  Future<void> _simulateLoading() async {
    _loadingController.startLoading(); // Start loading
    await Future.delayed(const Duration(seconds: 3)); // Simulated delay
    _loadingController.stopLoading(); // Stop loading
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLoadingHandler(
      controller: _loadingController,
      backgroundColor: Colors.black54, // Overlay color
      loadingBoxColor: Colors.white, // Loading box color
      loadingIndicatorColor: Colors.blue, // Spinner color
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Screen Loading Handler'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _simulateLoading,
            child: const Text('Simulate Loading'),
          ),
        ),
      ),
    );
  }
}
