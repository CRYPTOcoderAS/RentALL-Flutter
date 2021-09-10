import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/categories/category/books.dart';
import 'package:rentall/pages/categories/category/clothing.dart';
import 'package:rentall/pages/categories/category/combo.dart';
import 'package:rentall/pages/categories/category/consoles.dart';
import 'package:rentall/pages/categories/category/devices.dart';
import 'package:rentall/pages/categories/category/musicalInstruments.dart';
import 'package:rentall/pages/categories/category/unique.dart';
import 'package:rentall/widgets/appBar/appBar.dart';

class CategoriesList extends StatefulWidget {
  final int index;

  const CategoriesList({Key key, this.index}) : super(key: key);
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList>
    with SingleTickerProviderStateMixin {
  int selectedValue;
  PageController _controller;
  TabController controller;
  @override
  void setActiveTab(int selectedValue) {
    setState(() {
      selectedValue = widget.index;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedValue = widget.index;
    });
    controller =
        TabController(length: 7, vsync: this, initialIndex: selectedValue);
    _controller = PageController(
      initialPage: selectedValue,
      viewportFraction: 1,
    );
  }

  void dispose() {
    _controller.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xFFbe3144);
    return SafeArea(
      child: DefaultTabController(
        initialIndex: selectedValue,
        length: 7,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(140),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAppBar(),
                  TabBar(
                    controller: controller,
                    onTap: (value) {
                      setState(() {
                        selectedValue = value;
                        _controller.jumpToPage(selectedValue);
                      });
                    },
                    isScrollable: true,
                    unselectedLabelColor:
                        Theme.of(context).secondaryHeaderColor,
                    indicatorColor: color,
                    labelColor: color,
                    labelStyle: GoogleFonts.nunito(),
                    indicatorWeight: 3,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Musical Instruments',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Devices',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Consoles',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Clothing',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Books',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Combos',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Tab(
                          text: 'Unique',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: PageView(
            onPageChanged: (index) {
              setState(() {
                selectedValue = index;
                controller.animateTo((selectedValue));
              });
            },
            controller: _controller,
            children: [
              //PageNo : 0. Musical instruments, 1. Devices, 2. Consoles, 3.Clothing, 4. ACs, 5. Combos, 6. Unique
              MusicalInstruments(),
              Devices(),
              Consoles(),
              Clothing(),
              Books(),
              Combos(),
              Unique(),
            ],
          ),
        ),
      ),
    );
  }
}
