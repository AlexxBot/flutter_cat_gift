import 'package:cat_gift/core/global.dart/theme_data.dart';
import 'package:cat_gift/router.dart';
import 'package:flutter/material.dart';

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: customizedTheme,
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
