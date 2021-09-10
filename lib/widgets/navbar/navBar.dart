import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/navigation/tab_navigator.dart';

import '../../pages/cart/cartPage.dart';

class NavigationBar extends StatefulWidget {
  final int index;
  final String page;

  const NavigationBar({Key key, this.index, this.page}) : super(key: key);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex;
  String _currentPage;
  @override
  void initState() {
    _selectedIndex = widget.index;
    _currentPage = widget.page;
    super.initState();
  }

  @override
  List<String> pageKeys = ["Home", "Search", "Cart", "Profile"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Search": GlobalKey<NavigatorState>(),
    "Cart": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
  };

  Color color = Color(0xFFbe3144);

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Home") {
            _selectTab("Home", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Home"),
          _buildOffstageNavigator("Search"),
          _buildOffstageNavigator("Cart"),
          _buildOffstageNavigator("Profile"),
        ]),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Theme.of(context).primaryColor,

          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (int index) {
            _selectTab(pageKeys[index], index);
          },
          items: [
            BottomNavyBarItem(
              inactiveColor: Theme.of(context).secondaryHeaderColor,
              icon: Icon(Icons.home),
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Home'),
              ]),
              activeColor: color,
            ),
            BottomNavyBarItem(
              inactiveColor: Theme.of(context).secondaryHeaderColor,
              icon: Icon(Icons.search),
              activeColor: color,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Search'),
              ]),
            ),
            BottomNavyBarItem(
              inactiveColor: Theme.of(context).secondaryHeaderColor,
              icon: Stack(
                children: <Widget>[
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: _selectedIndex == 2
                        ? color
                        : Theme.of(context).secondaryHeaderColor,
                    size: 25,
                  ),
                  Positioned(
                    width: cartItemName.length < 10 ? 8 : 10,
                    height: cartItemName.length < 10 ? 13 : 9,
                    right: cartItemName.length < 10 ? 8.8 : 7.2,
                    // left: 10,
                    bottom: cartItemName.length < 10 ? 15 : 15,
                    // width: 10,
                    // height: 10,
                    // right: 8.9,

                    // bottom: 17,
                    child: Container(
                        width: 15,
                        height: 13.9,
                        // width: 15,
                        // height: 10,
                        color: Theme.of(context).primaryColor,
                        child: Center(
                            child: Text(cartItemName.length.toString(),
                                style: GoogleFonts.merriweather(
                                  fontSize: cartItemName.length < 10 ? 14 : 9,
                                  height: 1.2,
                                  color: _selectedIndex == 2
                                      ? color
                                      : Theme.of(context).secondaryHeaderColor,
                                  backgroundColor: _selectedIndex == 2
                                      ? color.withOpacity(0.2)
                                      : Theme.of(context).primaryColor,
                                )))),
                  ),
                ],
              ),
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Cart'),
              ]),
              activeColor: color,
            ),
            BottomNavyBarItem(
              inactiveColor: Theme.of(context).secondaryHeaderColor,
              icon: Icon(CupertinoIcons.person),
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Profile'),
              ]),
              activeColor: color,
            ),
          ],
        ),
        // BottomNavigationBar(
        //   onTap: (int index) {
        //     _selectTab(pageKeys[index], index);
        //   },
        //   currentIndex: _selectedIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //         color: color,
        //       ),
        //       title: Text("Home"),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.search,
        //         color: color,
        //       ),
        //       title: Text("Home"),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Stack(
        //         children: <Widget>[
        //           Icon(
        //             Icons.add_shopping_cart_outlined,
        //             color: color,
        //             size: 30,
        //           ),
        //           Positioned(
        //             right: 10,
        //             left: 10,
        //             bottom: 19,
        //             child: Container(
        //                 width: 13,
        //                 height: 13.9,
        //                 color: Theme.of(context).primaryColor,
        //                 child: Center(
        //                     child: Text(cartItems.toString(),
        //                         style:
        //                             GoogleFonts.merriweather(color: color)))),
        //           ),
        //         ],
        //       ),
        //       title: Text("Home"),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         CupertinoIcons.person,
        //         color: color,
        //       ),
        //       title: Text("Home"),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   int _currentIndex = 0;
//   // String currentPage;
//   // List<String> pageKeys = ["Home", "Search", "Cart", "Profile"];
//
//   final tabs = [
//     HomePage(),
//     Container(),
//     CartPage(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     int cartItems = 0;
//     Color color = Color(0xFFbe3144);
//     return Scaffold(
//       body: tabs[_currentIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: color,
//         height: 55,
//         color: Theme.of(context).primaryColor,
//         index: _currentIndex,
//         items: [
//           Icon(
//             Icons.home,
//             color: color,
//           ),
//           Icon(
//             Icons.search,
//             color: color,
//           ),
//           Stack(
//             children: <Widget>[
//               Icon(
//                 Icons.add_shopping_cart_outlined,
//                 color: color,
//                 size: 30,
//               ),
//               Positioned(
//                 right: 10,
//                 left: 10,
//                 bottom: 19,
//                 child: Container(
//                     width: 13,
//                     height: 13.9,
//                     color: Theme.of(context).primaryColor,
//                     child: Center(
//                         child: Text(cartItems.toString(),
//                             style: GoogleFonts.merriweather(color: color)))),
//               ),
//             ],
//           ),
//           Icon(
//             CupertinoIcons.person,
//             color: color,
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         animationCurve: Curves.easeInBack,
//         animationDuration: const Duration(milliseconds: 300),
//       ),
//     );
//   }
// }
