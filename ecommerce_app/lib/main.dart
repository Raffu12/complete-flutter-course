import 'dart:async';

import 'package:ecommerce_app/src/app.dart';
import 'package:flutter/material.dart';
//ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  await runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();
  // https://docs.flutter.dev/testing/errors
  usePathUrlStrategy();
    runApp(const MyApp());

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
  });
}
