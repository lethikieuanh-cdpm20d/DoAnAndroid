import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/start.dart';
import 'login.dart';
import 'category.dart';

class homepageScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepageScreenHome(),
    );
  }
}

class homepageScreenHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return homepageScreenState();
  }
}

class homepageScreenState extends State<homepageScreenHome> {
  int selectedIndex = 1;
  final Widget _myHome = MyHome();
  final Widget _myCategorys = MyCategorys();
  final Widget _challenge = Challenge();
  Widget getBody() {
    if (selectedIndex == 1) {
      return _myHome;
    } else if (selectedIndex == 0) {
      return _myCategorys;
    } else {
      return _challenge;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Trương Đức Quyền'),
            ),
            ListTile(
              title: const Text('Đăng xuất',style: TextStyle(color: Colors.red),),
              onTap: () {
                Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                  // ignore: prefer_const_constructors
                  builder: (BuildContext context) => StartApp(),
                ),
                (Route<dynamic> route) => false,
              );
              }
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 17, 224, 93),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 80),
                child: const Text('QuizzGame'),
              ),
              Container(
                padding: const EdgeInsets.only(left: 70),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ],
          )),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        selectedIconTheme:
            const IconThemeData(color: Colors.blue, opacity: 1.0, size: 45),
        unselectedIconTheme:
            const IconThemeData(color: Colors.black45, opacity: 0.5, size: 25),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Chủ đề'),
          const BottomNavigationBarItem(icon: Icon(Icons.house), label: ''),
          const BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_outlined), label: 'Thách đấu')
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Coming Soon"));
  }
}

class MyCategorys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return categoryScreen();
  }
}

class Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Coming Soon"));
  }
}
