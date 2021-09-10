import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentall/pages/home/homepage.dart';
import 'package:rentall/pages/profile/profile.dart';
import 'package:rentall/pages/search/search.dart';

import '../../pages/cart/cartPage.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Home")
      child = HomePage();
    else if (tabItem == "Search")
      child = Search();
    else if (tabItem == "Cart")
      child = CartPage();
    else if (tabItem == "Profile") child = Profile();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
