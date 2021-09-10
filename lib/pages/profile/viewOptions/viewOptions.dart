import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/profile/viewOptions/increaseTime.dart';
import 'package:rentall/pages/profile/viewOptions/ownIt.dart';
import 'package:rentall/widgets/widgets.dart';

class viewOptions extends StatefulWidget {
  final int productIndex;
  final int index;

  const viewOptions({Key key, this.productIndex, this.index}) : super(key: key);
  @override
  _viewOptionsState createState() => _viewOptionsState();
}

class _viewOptionsState extends State<viewOptions>
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
        TabController(length: 2, vsync: this, initialIndex: selectedValue);
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "viewOptions",
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: Container(
              width: 500,
              height: 500,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      DefaultTabController(
                        initialIndex: selectedValue,
                        length: 2,
                        child: Container(
                          width: 300,
                          height: 500,
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            appBar: PreferredSize(
                              preferredSize: Size.fromHeight(140),
                              child: Container(
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.white),
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TabBar(
                                      controller: controller,
                                      onTap: (value) {
                                        setState(() {
                                          selectedValue = value;
                                          _controller.jumpToPage(selectedValue);
                                        });
                                      },
                                      isScrollable: true,
                                      unselectedLabelColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      indicatorColor: color,
                                      labelColor: color,
                                      labelStyle: GoogleFonts.nunito(),
                                      indicatorWeight: 3,
                                      tabs: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Tab(
                                            text: 'Increase Period',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Tab(
                                            text: 'Own it',
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
                                //index : 0. Increase period, 1. Own it
                                // productIndex: Index of the product (i.e.,cartItemName[index])
                                IncreaseTime(productIndex: widget.productIndex),
                                OwnIt(productIndex: widget.productIndex),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
