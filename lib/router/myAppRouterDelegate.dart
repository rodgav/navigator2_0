import 'package:flutter/material.dart';
import 'package:navigator2_0/router/myAppPath.dart';
import 'package:navigator2_0/router/pageManage.dart';
import 'package:provider/provider.dart';

class MyAppRouterDelegate extends RouterDelegate<MyAppPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyAppPath> {
  MyAppRouterDelegate() {
    _pageManager.addListener(notifyListeners);
  }

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final RouterPageManager _pageManager = RouterPageManager();

  @override
  MyAppPath get currentConfiguration => _pageManager.currentPath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _pageManager,
      child: Consumer<RouterPageManager>(
        builder: (context, pageManager, child) {
          return Navigator(
            pages: List.of(_pageManager.pages),
            onPopPage: _onPopPage,
          );
        },
      ),
    );
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(MyAppPath configuration)async {
    await _pageManager.setNewRoutePath(configuration);
  }

  bool _onPopPage(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pageManager.didPop(route.settings);
    return true;
  }
}
