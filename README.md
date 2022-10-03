# Learning Flutter

For our new project we decided to use flutter. The app should run on desktops, Android tablets, iOS tablets and the web. Soon I realized, there are many best practices, many sources, many possibilities to do things right. As usual, there is more than one way of doing it right :wink: In this repository I share my learnings and experiences. In addition, I explain, how I will set up the new project and why I do it the way I do it. Following the commit history, you may understand each step. The result is a simple app using all the mentioned and chosen packages and approaches. Have fun :smile: 

## VS Code
List of helpful extensions, most coming from 
- general (helpful for many programming languages)
  - [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  - [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
  - [Rainbow Brackets](https://marketplace.visualstudio.com/items?itemName=2gua.rainbow-brackets)
- required
  - [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) -- includes installation of extension Dart
- optional, most coming from [Essential VS Code extensions for Flutter](https://blog.logrocket.com/essential-vs-code-extensions-for-flutter/) - time will show, which of them I really use ...
  - architecture - you will not need both
    - [bloc](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc) -- I will use bloc
    - [GetX Snippets](https://marketplace.visualstudio.com/items?itemName=get-snippets.get-snippets) -- quick and easy and maybe quick and dirty ...
  - code generation
    - [Awesome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets)
    - [Flutter Tree](https://marketplace.visualstudio.com/items?itemName=marcelovelasquez.flutter-tree)
    - [Better Flutter Tests](https://marketplace.visualstudio.com/items?itemName=andreasblech.better-tests)
    - [flutter_mobx - refactoring help](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-mobx)

## Flutter installation
Check flutter installation
```cmd
flutter doctor
```
Clean up installation
```cmd
flutter clean
flutter pub cache repair
flutter pub get
```
## Build/Debug
Android: start emulator first, select it on the bottom of vs code and press f5
Debug web app
```cmd
flutter run -d chrome
```
Build windows app
```cmd
flutter build windows
```


## Specialities of Dart -- coming from Kotlin, ...
- no type declaration necessary, nevertheless strongly typed
- everything is an object, even ints
- type Runes (emojis, utf32 strings -- normal String is utf8)
- new is optional
- single inheritance
- supports optional parameters
- null safety as in Kotlin with ?
- operators like ?:
- no public, private, protected, private for lib by naming prefix _, hence default is public
- supports async/await
- list looks like an array
- as in Python
```dart
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
```

## Interesting Flutter libs
Inspired by wonderous example app and the [architecture links](###Architecture), ordered alphabetically. Required/with the project generated libs not included. The descriptions are taken from the packages itself. I plan to use all the mentioned libs in my project.
- [cached_network_image](https://pub.dev/packages/cached_network_image): Flutter library to load and cache network images. Can also be used with placeholder and error widgets.
- [dio](https://pub.dev/packages/dio): A powerful Http client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc.
- [drift](https://pub.dev/packages/drift): Drift is a reactive library to store relational data in Dart and Flutter applications. 
- [equatable](https://pub.dev/packages/equatable): A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode. 
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package. 
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): Flutter Secure Storage provides API to store data in secure storage. Keychain is used in iOS, KeyStore based solution is used in Android. 
- [freezed](https://pub.dev/packages/freezed): Code generation for immutable classes that has a simple syntax/API without compromising on the features. 
- [get_it](https://pub.dev/packages/get_it): Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App"  
- [injectable](https://pub.dev/packages/injectable): Injectable is a convenient code generator for get_it. Inspired by Angular DI, Guice DI and inject.dart. 
- [logger](https://pub.dev/packages/logger): Small, easy to use and extensible logger which prints beautiful logs. 
- [mockito](https://pub.dev/packages/mockito): A mock framework inspired by Mockito with APIs for Fakes, Mocks, behavior verification, and stubbing.
- [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger): Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy to read format. 
- [responsive_framework](https://pub.dev/packages/responsive_framework): Easily make Flutter apps responsive. Automatically adapt UI to different screen sizes. Responsiveness made simple.
- [styled_widget](https://pub.dev/packages/styled_widget): Simplifying your widget tree structure by defining widget using methods. Taking ispiration from CSS and SwiftUI

## Learning path - plan to implement a simple app using the resources and libs listed
1. create the app following [Get started
Test drive ](https://docs.flutter.dev/get-started/test-drive)
  - The template did not ask for a package name. Used notepad++ file search ... -- this is very tedious lateron ....
  - tested created project on Android, Windows (exe found in src\findus\build\windows\runner\Release), Chrome -- see [Build/Debug](##Build/Debug)
2. add internationalization -- otherwise extracting all the strings later is a hassle
  - following instractions of https://docs.flutter.dev/development/accessibility-and-localization/internationalization -- you need to add the lines step by step, as described, do not tempt to do two steps at once ...
  - after adding a string you might need to run `flutter gen-l10n`
  - as it is quite a lot of code to use the strings, I copied the approach of the wonderous app and hence needed to use get_it already
3. define theme as done in wonderous
4. make it responsive using responsive_framework
4. add internationalizaton as done in wonderous (check for lib first)
5. add bottom navigation similar to wonderous
6. add a listview as described in [What is the alternative to a ListView in Flutter?](https://docs.flutter.dev/get-started/flutter-for/android-devs#listviews--adapters)
7. fetch data from api using dio
8. add logging and dio-logger
9. add bloc and repository pattern and get_it and injectable and freezed
10. add tests using mockito
11. cache data local using drift
12. add fancy buttons using styled_widget
13. dart_code_metrics

  

## Resources
Collection of articles to read again and again ...
### Dart
- https://dart.dev/guides/language/language-tour
- https://dart.dev/guides/language/language-tour#asynchrony-support

### Flutter
- Coming from Android
  - https://docs.flutter.dev/get-started/flutter-for/android-devs 
  - https://burhanrashid52.medium.com/flutter-for-android-developers-how-to-design-activity-ui-in-flutter-4bf7b0de1e48 

### Architecture
- https://blog.logrocket.com/dependency-injection-flutter-using-getit-injectable/
- https://codewithandrea.com/articles/flutter-repository-pattern/
- https://pub.dev/packages/get
- https://betterprogramming.pub/flutter-clean-architecture-test-driven-development-practical-guide-445f388e8604 -- from my point of view, a bit too much
- [GetX VS Bloc](https://xceltec.blogspot.com/2022/05/getx-vs-bloc-which-one-is-best-for-flutter-app-development.html) -- I follow the arguments and will use bloc. Most convincing arguments: no sponsors (>100 contributors), anti patterns, bad testability 

### Example apps
- https://github.com/gskinnerTeam/flutter-wonderous-app
- https://github.com/jhomlala/feather
- https://github.com/burhanrashid52/WhatTodo

### Design
- https://www.figma.com/community/plugin/844008530039534144/FigmaToFlutte


Any comments appreciated :smile: