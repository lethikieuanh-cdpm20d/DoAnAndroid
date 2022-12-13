import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/invite.dart';

import 'package:flutter_application_1/listfriend.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/rank.dart';
import 'package:flutter_application_1/search.dart';

import 'package:flutter_application_1/profile/profile_screen.dart';
import 'category_list/category.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class homepageScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homepageScreenHome(),
    );
  }
}

class homepageScreenHome extends StatefulWidget {
  const homepageScreenHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => homepageScreenState();
}

class homepageScreenState extends State<homepageScreenHome> {
  final user = FirebaseAuth.instance.currentUser!;
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
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Thoát khỏi ứng dụng?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 224, 93),
                  ),
                  child: CircleAvatar(
                    child: Text(
                      'HN',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  title: const Text('Thông tin tài khoản'),
                  onTap: () {
                    //Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  title: const Text('Bạn bè'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListFriend(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.insert_chart_outlined,
                    color: Colors.orange,
                  ),
                  title: const Text('Bảng xếp hạng'),
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
                    title: const Text(
                      'Đăng xuất',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Đăng xuất khỏi ứng dụng?'),
                              icon: Icon(Icons.notifications),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                    Navigator.pushAndRemoveUntil<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        // ignore: prefer_const_constructors
                                        builder: (BuildContext context) =>
                                            LoginScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          });
                    }),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => searchSreen()));
                      },
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
                TabItem(icon: Icons.list, title: 'Chủ đề'),
                TabItem(icon: Icons.house, title: '            '),
                TabItem(icon: Icons.gamepad_outlined, title: 'Thách đấu'),
              ],
              initialActiveIndex: 1,
              onTap: (int index) {
                onTapHandler(index);
              }),
        ));
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return rankSreen();
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
    return InviteChallengeScreen();
  }
}
