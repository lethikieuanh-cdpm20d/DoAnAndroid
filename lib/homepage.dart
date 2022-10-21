import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/start.dart';
import 'login.dart';
import 'category.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class homepageScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          children:[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 17, 224, 93),
              ),
              child: CircleAvatar(
              child: Text(
                'HN',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.green,
              ),
              title: const Text('Photo/Video'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: const Text('Tag People'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.tag_faces_outlined,
                color: Colors.orange,
              ),
              title: const Text('Felling/Activity'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.map,
                color: Colors.red,
              ),
              title: const Text('Checking'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: Colors.lightBlue,
              ),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: const Icon(
                Icons.output_rounded,
                color: Colors.red,
              ),
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const TabItem(icon: Icons.list,title:'Chủ đề'),
          TabItem(icon: Icons.house,title: '            '),
          TabItem(icon: Icons.gamepad_outlined,title: 'Thách đấu'),
        ],
        initialActiveIndex: 1,
        onTap: (int index) {
          onTapHandler(index);
        }
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
