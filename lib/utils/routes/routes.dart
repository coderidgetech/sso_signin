import 'dart:async';

import 'package:flutter/material.dart';
import 'package:single_sign_on/view/LoginScreen.dart';
import 'package:single_sign_on/utils/routes/routes_name.dart';
import 'package:single_sign_on/view/Normal.dart';
import 'package:single_sign_on/view/OtpScreen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.normal:
        // final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) => NormalScreen());

      case RoutesName.otp:
        final args = settings.arguments as Map<String, dynamic>;
        var username = args['username'];
        var call_back = args['call_back'];
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              OTPScreen(username: username, onLoginPressed: call_back),
        );
      case RoutesName.web_view:
        final args = settings.arguments as Map<String, dynamic>;
        dynamic authUrl = args['authUrl'];
        print("object");
        return MaterialPageRoute(
            builder: (context) => WebViewScreen(
                  authUrl: authUrl,
                ));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
