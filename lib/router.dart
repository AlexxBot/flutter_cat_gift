import 'package:flutter/material.dart';

import 'features/cat/presentation/pages/cat_page.dart';

class RouteGenerator {
  static const String catPage = '/';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case catPage:
        return MaterialPageRoute(builder: (_) => const CatPage());
      default:
        throw const RouteException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
