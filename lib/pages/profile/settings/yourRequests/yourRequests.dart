import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/profile/settings/yourRequests/refunds.dart';
import 'package:rentall/pages/profile/settings/yourRequests/requests.dart';
import 'package:rentall/widgets/widgets.dart';

class yourRequests extends StatefulWidget {
  final int index;

  const yourRequests({Key key, this.index}) : super(key: key);
  @override
  _yourRequestsState createState() => _yourRequestsState();
}

class _yourRequestsState extends State<yourRequests>
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              initialIndex: selectedValue,
              length: 2,
              child: Container(
                width: 500,
                height: size.height,
                child: Scaffold(
                  backgroundColor: Theme.of(context).primaryColor,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(140),
                    child: Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.white),
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment
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
                            unselectedLabelColor:
                                Theme.of(context).secondaryHeaderColor,
                            indicatorColor: color,
                            labelColor: color,
                            labelStyle: GoogleFonts.nunito(),
                            indicatorWeight: 3,
                            tabs: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Tab(
                                  text: 'Requests',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Tab(
                                  text: 'Refunds',
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
                      Requests(),
                      Refunds(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
