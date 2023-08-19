import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_qtim/repository/news_repository.dart';
import 'package:test_app_qtim/router/route.dart';
import 'package:test_app_qtim/theme/theme.dart';

void main() {
  runApp(const NewsListApp());
  GetIt.I.registerSingleton(MockNewsRepository());
}

class NewsListApp extends StatelessWidget {
  const NewsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routes: routes,
      initialRoute: '/',
    );
  }
}
