import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => widget),
  );
}

void popALlAndPushPage(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
        (Route<void> route) => false,
  );
}

void popAllAndPushName(BuildContext context, String widget) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    widget,
        (Route<void> route) => false,
  );
}

Future<dynamic> pushName(BuildContext context, String route,
    {dynamic arguments}) async {
  return await Navigator.of(context).pushNamed(route, arguments: arguments);
}

Future<dynamic> pushNameForResult(BuildContext context, String route) async {
  return await Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameWithArgumentsForResult(
    BuildContext context, String route, dynamic argument) async {
  return await Navigator.of(context).pushNamed(route, arguments: argument);
}

void pushNameWithArguments(BuildContext context, String route, dynamic argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

pushPageForResult(BuildContext context, Widget widget) async {
  return await Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
  );
}

void popScreen(BuildContext context, int size) {
  int count = 0;
  Navigator.of(context).popUntil((_) => count++ >= size);
}

void popAndPushName(BuildContext context, String route, {dynamic arguments}) {
  Navigator.of(context).popAndPushNamed(route, arguments: arguments);
}

pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    PageRouteBuilder<void>(
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
            FadeTransition(opacity: animation, child: child),
        pageBuilder: (BuildContext context, Animation<dynamic> animation,
            Animation<dynamic> secondaryAnimation) {
          return widget;
        }),
  );
}