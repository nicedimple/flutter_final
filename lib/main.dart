import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/podcast_list_page.dart';
import 'pages/map_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/podcasts': (context) => PodcastListPage(),
        '/map': (context) => MapPage(),
      },
    );
  }
}
