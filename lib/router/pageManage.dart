import 'package:flutter/material.dart';
import 'package:navigator2_0/arguments/pageArgument.dart';
import 'package:navigator2_0/pages/home.dart';
import 'package:navigator2_0/pages/page1.dart';
import 'package:navigator2_0/pages/page2.dart';
import 'package:navigator2_0/pages/unknown.dart';
import 'package:navigator2_0/router/myAppPath.dart';
import 'package:provider/provider.dart';

class RouterPageManager with ChangeNotifier {
  static RouterPageManager of(BuildContext context) {
    return Provider.of<RouterPageManager>(context, listen: false);
  }

  final List<Page> _pages = [
    MaterialPage(key: UniqueKey(), name: '/', child: HomePage())
  ];

  List<Page> get pages => List.unmodifiable(_pages);

  MyAppPath get currentPath => MyAppPath.parse(_pages.last.name);

  openPage(String name, {Object arguments}) {
    PageArgument pageArgument = arguments;
    switch (name) {
      case 'page1':
        _pages.add(MaterialPage(
            key: UniqueKey(),
            name: '/page1/${pageArgument.id}',
            child: Page1(pageArgument: pageArgument)));
        break;
      case 'page2':
        _pages.add(MaterialPage(
            key: UniqueKey(),
            name: '/page2/${pageArgument.id}',
            child: Page2(pageArgument: pageArgument)));
        break;
      default:
        break;
    }
    notifyListeners();
  }

  void didPop(Page page) {
    debugPrint('pageKey ${page.key}');
    debugPrint('pageName ${page.name}');
    debugPrint('pageArgs ${page.arguments}');
    _pages.remove(page);
    notifyListeners();
  }

  void didPopAll() {
    _pages.clear();
    _pages.add(MaterialPage(key: UniqueKey(), name: '/', child: HomePage()));
    notifyListeners();
  }

  Future<void> setNewRoutePath(MyAppPath configuration) async {
    if (configuration.isUnknown) {
      open404();
    } else if (configuration.isPage1) {
      PageArgument pageArgument =
          PageArgument(id: configuration.id, name: 'Unknown');
      openPage('page1', arguments: pageArgument);
    } else if (configuration.isPage2) {
      PageArgument pageArgument =
          PageArgument(id: configuration.id, name: 'Unknown');
      openPage('page2', arguments: pageArgument);
    } else if (configuration.isHome) {
      _pages.removeWhere((element) => element.name != '/');
      notifyListeners();
    }
  }

  open404() {
    _pages.add(
        MaterialPage(key: UniqueKey(), name: '/404', child: UnknownPage()));
    notifyListeners();
  }
}
