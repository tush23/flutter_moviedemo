import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  ///String
  static const String app_name = "Movie Demo";
  static const String app_version = "Version 1.0.0";
  static const String google_sans_family = "GoogleSans";
  static const String welcomeText = "Welcome to Custom DevFest";
  static const String descText =
      "DevFests are community-led developer events hosted by Google Developer Groups around the globe. GDGs are focused on community building and learning about Google’s technologies";
  static const String loadingText = "Loading...";
  static const String tryagainText = "try again";
  static const String signInText = "Sign In";
  static const String someErrorText = "Error accured";
  static const String signInWithGoogleText = 'Sign in with Google';
  static const String somethingWentWrongText = "Some thing went wrong";
  static const String signOutText = "Sign out";
  static const String confirmText = "confirm";
  static const String supportNeededText = "Support Needed";
  static const String moreFeatureText = "More Features";
  static const String featureReqText = "Feature Request";
  static const String updateNowText = "Update Now";
  static const String checkNetText = "Check Internet";

  static const String imgUrl = "https://image.tmdb.org/t/p/original/";
  static const String imgUrlWidth200 = "https://image.tmdb.org/t/p/w200/";

  static const int app_version_code = 1;
  static const String app_color = "ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondryAppColor = Colors.black;
  static bool isDebugMode = true;

  /// Preferences
  static SharedPreferences perfs;
  static const String darkModeperf = 'DarkModePerf';

  goToPage(context, page) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }
}

class AppColor {
  static const Color mainColor = Colors.white54;
}

class Appfont {
  static const String mainFont = "Product Sans";
}
