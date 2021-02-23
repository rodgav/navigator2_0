import 'package:flutter/material.dart';
import 'package:navigator2_0/zoomSlideUpTransitionBuilder.dart';
import 'package:navigator2_0/router/myAppRouteInformationParser.dart';
import 'package:navigator2_0/router/myAppRouterDelegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: ZoomSlideUpTransitionsBuilder(),
          TargetPlatform.android: ZoomSlideUpTransitionsBuilder(),
        }),
      ),
      routeInformationParser: MyAppRouteInformationParser(),
      routerDelegate: MyAppRouterDelegate(),
    );
  }
}
