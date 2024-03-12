# Navika

The way to move around Paris and Île-de-France.
\
Navika is a mobility application with the objective of covering the entire France.

See it in action: [Navika](https://play.google.com/store/apps/details?id=com.lowa.navika)

## Needed
### Flutter
Before you begin, make sure you have Flutter installed: [Install Flutter](https://flutter.dev/docs/get-started/install)

## Installation
### Here
You also need the Here SDK (for maps); the documentation is here: [SDK for Flutter Explore Edition](https://www.here.com/docs/bundle/sdk-for-flutter-explore-developer-guide/page/README.html), and it can be downloaded here: [Here Platform](https://platform.here.com/portal/sdk).
\
Next, place the SDK in the `plugins/here_sdk` folder and add your HERE credentials to `lib/src/data/credentials.dart`.

### Firebase
The last step is to add Firebase (for notifications and crash analytics). Follow the instructions here: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?hl=fr&authuser=0&platform=ios) and add your credentials to `lib/src/data/credentials.dart`.
\
Don't forget to place `google-services.json` file in `android/app`.

*Note: By making some modifications, especially in `lib/main.dart`, it is possible to omit Firebase.*


### Android 7.1 or lower
To ensure this app work on Android 7.1 or lower, a certificate is present in `assets/ca/lets-encrypt-r3.pem`: [See more](https://stackoverflow.com/a/71090239)


# Built it
Then you can easily built the using `flutter run`.


# API
This apps work with [Navika_Api](https://github.com/MaisClement/Navika_Api/)


# Contribute
If you are motivated, do not hesitate to contribute to this project.
