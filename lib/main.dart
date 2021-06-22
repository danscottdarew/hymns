import 'package:catholic_classics_hymns/model/hymn_repo.dart';
import 'package:catholic_classics_hymns/widgets/hymn_screen.dart';
import 'package:flutter/material.dart';
import 'package:catholic_classics_hymns/widgets/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/hymn_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        HymnScreen.id: (context) => HymnScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => HymnBloc(HymnRepo()),
        child: HomeScreen(),
      ),
    );
  }
}
