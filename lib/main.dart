import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yohidon/page/activity_page.dart';
import 'package:yohidon/page/record_page.dart';
import 'package:yohidon/page/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = [
    RecordPage(),
    RegisterPage(),
    ActivityPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined), label: '記録'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: '登録'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'アクティビティ')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
