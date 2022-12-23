import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile/UserObject.dart';
import 'package:flutter_application_1/profile/profile_screen.dart';

class EditprofileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditprofileScreenState();
  }
}

class EditprofileScreenState extends State<EditprofileScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  List<UserObject> lsUser = [];

  final ref = FirebaseDatabase.instance.ref();
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

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  Mail() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].email}';
      }
    }
    return 'khong co';
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].name}';
      }
    }
    return 'khong co';
  }

  Pass() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].password}';
      }
    }
  }

  String uidUser = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 237, 181),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 127, 242, 101),
        title: const Text(
          'Chỉnh sửa thông tin',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ClipOval(
                child: Image.asset(
                  'images/doi.jpg',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  const Text(
                    'NAME',
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 229, 13, 204)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
                    child: TextField(
                      controller: txtname,
                      decoration: InputDecoration(
                        label: Text(
                          "   ${Ten()}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 172, 240, 172),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              // padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 187, 16, 90)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
                    child: Text(
                      '${Mail()}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 240, 7, 127)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.only(top: 50),
              //padding: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 44, 6, 232)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Text('Lưu', style: TextStyle(fontSize: 28)),
                onPressed: () {
                  if (txtname.text != "") {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    final ref = FirebaseDatabase.instance.ref().child('users');
                    for (int i = 0; i < lsUser.length; i++) {
                      if (uidUser == lsUser[i].uid) {
                        ref.child(lsUser[i].uid).update({
                          'name': txtname.text,
                        });
                      } else if (txtname.text == '') {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'THÔNG BÁO',
                                  style: TextStyle(fontSize: 20),
                                ),
                                content: Text('Mời nhập tên <3'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            });
                      }
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
