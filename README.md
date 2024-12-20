# ScreenLoadingHandler

The **ScreenLoadingHandler** is a Flutter widget that displays a loading indicator (spinner) over the main content of a screen. It automatically listens to a `ScreenLoadingController` to determine when to show or hide the loading indicator, without needing to call `setState`. This is an efficient way to manage loading states in your app without cluttering your UI code.


## Features

- **Automatic Loading Management**: Displays and hides a loading indicator based on the `isLoading` state in the `ScreenLoadingController`.
- **Customizable Loading Box**: You can customize the color, size, and style of the loading indicator and the loading box.
- **Tap to Close (Optional)**: Optionally close the loading indicator by tapping on the overlay.
- **Reactive State Updates**: The loading state is managed by a `ValueNotifier`, which ensures the UI reacts automatically when the state changes.

## Installation

1. Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  screen_loading_handler: ^<latest_version>
```

> Replace `<latest_version>` with the actual latest version of the package. You can check the latest version on [pub.dev](https://pub.dev/packages/screen_loading_handler).

2. Install the package by running:

```bash
flutter pub get
```

## Usage

### 1. Create the Loading Controller

First, initialize the `ScreenLoadingController`:

```dart
ScreenLoadingController controller = ScreenLoadingController();
```

### 2. Wrap Your Screen with `ScreenLoadingHandler`

Use `ScreenLoadingHandler` to wrap your screen’s content, passing in the controller:

```dart
ScreenLoadingHandler(
  controller: controller,
  child: YourScreenWidget(),
)
```

### 3. Start and Stop Loading

Control the loading state by calling `startLoading` and `stopLoading`:

```dart
controller.startLoading(); // To show the loading indicator
controller.stopLoading();  // To hide the loading indicator
```

## Customization

You can customize the appearance of the loading indicator and the overlay by passing parameters to the `ScreenLoadingHandler` widget:

- `backgroundColor`: The background color of the overlay (default is `Colors.white10`).
- `loadingBoxColor`: The color of the loading box (default is `Colors.black`).
- `loadingIndicatorColor`: The color of the loading spinner (default is `Colors.white`).
- `loadingBoxHeight`: The height of the loading box (default is `90`).
- `loadingBoxWidth`: The width of the loading box (default is `90`).
- `loadingBoxBorderRadius`: The border radius of the loading box (default is `18`).
- `loadingIndicatorStrokeWidth`: The thickness of the loading spinner (default is `3`).
- `closeOnTap`: Whether to close the loading indicator by tapping on the overlay (default is `false`).

Example:

```dart
ScreenLoadingHandler(
  controller: controller,
  child: YourScreenWidget(),
  closeOnTap: true, // Close loading indicator on tap
  backgroundColor: Colors.black45,
  loadingBoxColor: Colors.blue,
  loadingIndicatorColor: Colors.white,
)
```

## Example

```dart
ScreenLoadingController controller = ScreenLoadingController();

ScreenLoadingHandler(
  controller: controller,
  child: Scaffold(
    appBar: AppBar(title: Text('Loading Example')),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          controller.startLoading();
          Future.delayed(Duration(seconds: 3), () {
            controller.stopLoading();
          });
        },
        child: Text('Show Loading'),
      ),
    ),
  ),
)
```

## Testing

To ensure the correct behavior of `ScreenLoadingHandler`, you can write tests to verify that the loading indicator appears and disappears based on the controller's state.

Refer to the [tests](./test/screen_loading_handler_test.dart) for example test cases.

## ☕ Support

If you find this project useful, consider supporting me by buying me a coffee! 

<a href="https://www.buymeacoffee.com/adarshneeds">
  <img src="https://github.com/user-attachments/assets/40372fba-f86c-4930-be63-66f1f49454ec" alt="Buy Me A Coffee" width="240" height="60"/>
</a>

Your support helps me continue developing open-source projects and maintain the quality of my work. Thank you for your generosity!

## Feedback

We'd love to hear your thoughts! Feel free to create an issue on this repository if you have any suggestions or concerns.

You can also fill out this [Google Form](https://forms.gle/7xRrf5PjbgpA5M3k6) to provide feedback.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
