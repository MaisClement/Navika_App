<p align="center">
  <img height="80" src="https://github.com/MaisClement/Navika_App/blob/master/assets/img/logo/logo.png?raw=true">
</p>
<h3 align="center">
    An open-source and user-friendly transit app
</h3>

<p align="center">
    <a href="https://www.buymeacoffee.com/navika">
        <img height="40" src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=☕&slug=navika&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" />
    </a>
</p>

<p align="center">
    <a href="https://en.wikipedia.org/wiki/MIT_License">
        <img src="https://img.shields.io/badge/Licence-MIT-blue?style=flat-square" />
    </a>
    <a href="https://github.com/MaisClement/Navika_App/releases/latest">
        <img alt="GitHub Release" src="https://img.shields.io/github/v/release/MaisClement/Navika_App?style=flat-square&color=gre">
    </a>
    <a href="https://github.com/MaisClement/Navika_App/stargazers">
        <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/MaisClement/Navika_App?style=flat-square&color=orange">
    </a>
</p>

<p align="center">
    Navika is an app to help you move around Paris and Île-de-France. 
    <br/>
    The objective of this application is to cover the whole of France.
</p>

<p align="center">
    <a href='https://play.google.com/store/apps/details?id=com.lowa.navika_r&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img height="60" alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/></a>
</p>

## Geting Started
### Install Flutter

To get started you'll need to set-up Flutter on your machine, you can follow the instructions here: [Install Flutter](https://docs.flutter.dev/get-started/install). \
Once done, you'll be ready to clone this repository and start coding!

### Here

Navika use the Here SDK (for maps); you'll find the documentation here: [SDK for Flutter Explore Edition](https://www.here.com/docs/bundle/sdk-for-flutter-explore-developer-guide/page/README.html), and it can be downloaded here: [Here Platform](https://platform.here.com/portal/sdk).

If you don't want (or need a map), simply leave blank credentials. Else,put the SDK in the `plugins/here_sdk` folder and add your HERE credentials to `lib\credentials.dart`.


### Firebase

Navika use firebase for notifications. Firebase is not required to build the app, you can safely disable it.

<details open>
<summary>✅ Using Firebase</summary>

You'll find the official instructions here: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?hl=fr&authuser=0&platform=ios)

1. Create a new Firebase application: [Firebase](https://console.firebase.google.com/project)
2. Download the `google-services.json` and place it `android\app` folder
3. Then edit `lib\credentials.dart` with your credentials.
    
    ---
</details>
<br />

<details open>
<summary>🚫 Disabling Firebase</summary>

To disable Firebase, simply remove (or comment) a lines in `android\settings.gradle` and `android\app\build.gradle` file:

- In `android\settings.gradle` remove the below content (line 23) 
    ```
    id "com.google.gms.google-services" version "4.4.0" apply false
    ```

- In `android\app\build.gradle` remove the below content (line 5) 
    ```
    id "com.google.gms.google-services"
    ```

    ---
</details>


### Built it

The, to build or run the application, simply execute the following command:
```
flutter run
```

## Contribute

Navika is open-source so you can use or re-use it. Don't hesitate to contribute !

If you have any ideas, suggestions, questions or want to report something, do not hesitate to contact us via [Twitter](https://twitter.com/navika_app) or by creating an issue.

## Licence

This project is licensed under the [MIT Licence](https://en.wikipedia.org/wiki/MIT_License), feel free to use or reuse it ! 💖