// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/routes/app_pages.dart';
import 'package:news_app/app/views/headlines_screen/headlines_screen.dart';
import 'package:news_app/app/views/short_news_screens/short_news_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Shorts News'),
              Tab(text: 'Headlines'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ShortNewsScreen(channelId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw',), // This will be updated later
            HeadlinesScreen(),
          ],
        ),
      ),
    );
  }
}
