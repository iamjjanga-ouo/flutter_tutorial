import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clone_netflix/screen/home_screen.dart';
import 'package:clone_netflix/screen/more_screen.dart';
import 'package:clone_netflix/widget/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState(); // MyApp 상태 관리
}

class _MyAppState extends State<MyApp> {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JjangaFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
