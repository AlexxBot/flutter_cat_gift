import 'package:cat_gift/features/cat/presentation/pages/cat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'features/cat/presentation/bloc/cat_bloc.dart';
import 'injections.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatBloc>(
      create: (context) => di.sl<CatBloc>(),
      child: const CatApp(),
    );
  }
}
