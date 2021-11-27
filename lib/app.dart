import 'package:cat_gift/router.dart';
import 'package:flutter/material.dart';

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
