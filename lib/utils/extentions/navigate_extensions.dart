import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamedScreen(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamedScreen(String routeName,
      {Object? argument}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedAndRemoveUntilScreen(String routeName,
      {Object? argument, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void popScreen() => Navigator.of(this).pop();
  Future<dynamic> pushScreen(Widget screen, {Object? argument}) =>
      Navigator.of(this).push(
        MaterialPageRoute(
            builder: (context) => screen,
            settings: RouteSettings(arguments: argument)),
      );

  void pushAndRemoveUntilScreen(Widget screen, {Object? argument}) =>
      Navigator.of(this).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => screen,
              settings: RouteSettings(arguments: argument)),
          (Route<dynamic> route) => false);
  //#============================IOS Transition=============================
  Future<dynamic> iosPushIOSScreen(Widget screen, {Object? argument}) =>
      Navigator.of(this).push(
        iosPageRouteBuilder(argument, screen),
      );
  void iosPushAndRemoveUntilScreen(Widget screen, {Object? argument}) =>
      Navigator.of(this).pushAndRemoveUntil(
          iosPageRouteBuilder(argument, screen),
          (Route<dynamic> route) => false);
}

PageRouteBuilder<Object?> iosPageRouteBuilder(Object? argument, Widget screen) {
  return PageRouteBuilder(
    settings: RouteSettings(arguments: argument),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return CupertinoPageTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: true,
        child: child,
      );
    },
  );
}
