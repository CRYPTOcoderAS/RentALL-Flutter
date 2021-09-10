import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color color = Color(0xFFbe3144);
var formatter = NumberFormat('#,##,000');
passwordType(String password) {
  final perfectPass = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6}$');
  return perfectPass.hasMatch(password);
}

bool isEmail(String string) {
  //Check whether the user entered is an email or not
  // Null or empty string is invalid
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}

bool validatePincode(String value) {
  // String regex;
  // regex = "^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}\$";
  // print(regex);
  String patttern = r'(^[1-9][0-9]{5}$)';
  RegExp regExp = new RegExp(patttern);
  if (regExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
  // if (value.length == 0) {
  //   return false;
  // } else if (!regExp.hasMatch(value)) {
  //   return false;
  // } else if (value.length > 6) {
  //   return false;
  // }
}

bool validateMobile(String value) {
  // Check whether the user entered is a mobile number or not
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  } else if (value.length > 10) {
    return false;
  }

  return true;
}

Container linearProgress(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      valueColor: AlwaysStoppedAnimation(color),
    ),
  );
}

class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    @required Rect begin,
    @required Rect end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin.left, end.left, elasticCurveValue),
      lerpDouble(begin.top, end.top, elasticCurveValue),
      lerpDouble(begin.right, end.right, elasticCurveValue),
      lerpDouble(begin.bottom, end.bottom, elasticCurveValue),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}

class DottedText extends Text {
  const DottedText(
    String data, {
    Key key,
    TextStyle style,
    TextAlign textAlign,
    TextDirection textDirection,
    Locale locale,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    String semanticsLabel,
  }) : super(
          '\u2022 $data',
          key: key,
          style: style,
          textAlign: textAlign,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
        );
}

class CardsStack extends StatelessWidget {
  final Widget lightCardChild;
  final Widget darkCardChild;

  const CardsStack({
    @required this.lightCardChild,
    @required this.darkCardChild,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Card(
            elevation: 2.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            // color: color,
            child: darkCardChild,
          ),
          Positioned(
            // !isOddPageNumber ? -25.0 : null,
            bottom: -15.0,
            // isOddPageNumber ? -25.0 : null,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                width: 110,
                height: 35,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  // borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey,
                      width: Theme.of(context).primaryColor == Colors.white
                          ? 0.5
                          : 0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(child: lightCardChild),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
