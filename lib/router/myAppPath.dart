import 'package:flutter/cupertino.dart';

class MyAppPath {
  final String id;
  final bool _isUnknown;

  MyAppPath.home()
      : id = null,
        _isUnknown = false;

  MyAppPath.unknown()
      : id = null,
        _isUnknown = true;

  MyAppPath.page1(String id)
      : id = id,
        _isUnknown = false;

  MyAppPath.page2(String id)
      : id = id,
        _isUnknown = false;

  bool get isHome => id == null;

  bool get isPage1 => id != null;

  bool get isPage2 => id != null;

  bool get isUnknown => _isUnknown;

  static MyAppPath parse(String url) {
    final uri = Uri.parse(url);

    if (uri.pathSegments.isEmpty) {
      return MyAppPath.home();
    }
    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'page1') {
      debugPrint(
          'page1--- first: ${uri.pathSegments.first} last: ${uri.pathSegments.last}');
      String id = uri.pathSegments.last;
      return MyAppPath.page1(id);
    }
    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'page2') {
      debugPrint(
          'page2--- first: ${uri.pathSegments.first} last: ${uri.pathSegments.last}');
      String id = uri.pathSegments.last;
      return MyAppPath.page2(id);
    }

    return MyAppPath.unknown();
  }
}
