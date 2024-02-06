# QuickLinker - A Flutter URL Shortening Application

<p align="center">
    <img src="assets/icons/quicklinker-logo.png" alt="QuickLinker Logo" width="150"/>
</p>

## Introduction

QuickLinker is a Flutter-based application engineered to streamline the process of shortening URLs.
It provides an intuitive interface for users to quickly shorten their links, with the added
convenience of offline access to their URL history.

> This is not just a technical showcase but also a testament to clean architecture and
> user-centric design in Flutter applications. It stands as a public testament to efficient
> problem-solving through technology.

## Technical Overview

### Project Structure

The application is structured to emphasize readability and scalability. It's organized into logical
layers, each with a distinct role following the Model-View-ViewModel (MVVM) pattern. This
architecture facilitates a clean separation of UI, state management, and business logic.

### Local Data Storage

Utilizing Hive, a high-performance key-value database, QuickLinker offers rapid and responsive local
data storage capabilities. This choice empowers users to access their data instantly, even in
offline modes, enhancing the overall user experience.

### Reactive State Management

The application embraces reactive state management through `ChangeNotifierProvider` and `Consumer`
widgets, which ties the UI closely with the ViewModel. This design pattern ensures that the UI
reacts to the state changes in the ViewModel, maintaining a clear and reactive user interface.

### Connectivity Awareness

QuickLinker is designed with connectivity in mind. It gracefully handles network changes, disabling
functionalities that require internet access and enabling them as soon as the connection is
restored. Users are kept informed with unobtrusive notifications, allowing for a seamless
experience.

### Resource Optimization

The application is conscientious about device resources. Services like connectivity monitoring are
paused when the app is not active, ensuring that device resources are not used unnecessarily. Upon
resuming, services are reactivated to keep the app's state current.

### Testing and Code Quality

The project is accompanied by a suite of unit and UI tests, affirming the reliability of the core
functionalities. Code quality is rigorously maintained, adhering to Flutter's best practices and
linting rules to ensure a clean, maintainable, and bug-free codebase.

## Usage Instructions

### Generating Models with Hive

To generate the models, execute:

```
flutter packages pub run build_runner build
```

### Running the Application

To run QuickLinker on your device, ensure you have Flutter installed and configured. Then, execute
the following command in your terminal:

```
flutter run
```

### Testing

Unit and widget tests are an integral part of QuickLinker. To run the tests, use:

```
flutter test
```

### Generating Icons and Splash Screens

QuickLinker uses custom icons and splash screens for a branded experience. To generate them, run:

```
flutter pub run flutter_launcher_icons:main
flutter pub run flutter_native_splash:create
```

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](LICENSE)**
- Copyright 2024 © Juan Alegría
