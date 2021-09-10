import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/widgets.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  List itemNames = [
    "Documentaries",
    "Self-help books",
    "JEE guides",
    "NEET guides",
    "10th Guides",
    "12th Guides",
    "Other Exams(UPSC..,)",
  ];
  List itemImg = [
    "images/category/books/documentary.jpeg",
    "images/category/books/book.jpg",
    "images/category/books/jee.jpg",
    "images/category/books/neet.jpg",
    "images/category/books/10cbse.jpg",
    // "images/category/books/10thstate.jpg",
    "images/category/books/12cbse.jpg",
    "images/noimage.png",
    // "images/category/books/12state.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "“The beautiful thing about learning is that nobody can take it away from you.”",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ),
                Divider(
                  indent: 100,
                  endIndent: 100,
                  color: color,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                  ),
                  itemCount: itemNames.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CardsStack(
                      lightCardChild: Center(
                        child: Text(
                          itemNames[index],
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                      darkCardChild: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(itemImg[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
