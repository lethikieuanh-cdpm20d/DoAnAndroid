import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

import 'package:flutter_application_1/profile/UserObject.dart';
import 'package:flutter_application_1/profile/edit.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsUser = [];
  String uidUser = "";
  bool kt = false;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    userData(); // kt va hien thi thong tin
    setState(() {});
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].name}';
      }
    }
    return 'khong co';
  }

  Mail() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].email}';
      }
    }
    return 'khong co';
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 132, 235, 151),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 17, 224, 93),
          title: Text(
            'Thông tin cá nhân',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ClipOval(
                child: Image.asset(
                  'images/person.png',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                'Name: ' + Ten(),
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 240, 7, 127),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                'Email: ${Mail()}',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 240, 7, 127)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              //margin: const EdgeInsets.only(top: 80),
              child: Text(
                'Điểm: ' "1000",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 240, 7, 127)),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.only(top: 70),
              //padding: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 246, 14, 6)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text('Sửa', style: TextStyle(fontSize: 28)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditprofileScreen()));
                },
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.only(top: 30),
              //padding: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 17, 13, 221)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Text('Quay về trang chủ',
                    style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homepageScreeen()));
                },
              ),
            ),
          ],
        ));
  }
}
