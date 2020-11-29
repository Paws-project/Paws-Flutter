import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class AuthChannel {
  static const authChannel = MethodChannel("auth_channel");

  static void init() {
    authChannel.setMethodCallHandler((call) {
      // TODO: Authenticate
      print(call.method);
      print(call.arguments);
      url.closeWebView();
      return null;
    });
  }
}
