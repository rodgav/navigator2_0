import 'package:flutter/widgets.dart';
import 'package:navigator2_0/router/myAppPath.dart';

class MyAppRouteInformationParser extends RouteInformationParser<MyAppPath> {
  @override
  Future<MyAppPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return MyAppPath.parse(routeInformation.location);
  }

  @override
  RouteInformation restoreRouteInformation(MyAppPath configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (configuration.isHome) {
      return RouteInformation(location: '/');
    }
    if (configuration.isPage1) {
      return RouteInformation(location: '/page1/${configuration.id}');
    }
    if (configuration.isPage2) {
      return RouteInformation(location: '/page2/${configuration.id}');
    }
    return null;
  }
}
