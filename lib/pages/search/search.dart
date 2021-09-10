import 'package:flutter/material.dart';
import 'package:rentall/widgets/appBar/appBar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: CommonAppBar(),
        ),
        body: Text('Search page'));
  }
}
