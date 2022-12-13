import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class signupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return signupScreenState();
  }
}

class signupScreenState extends State<signupScreen> {
  TextEditingController txtPasswordController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  //final _auth = FirebaseAuth.instance;

  final ref = FirebaseDatabase.instance.ref().child('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: Container(
        color: Color.fromARGB(246, 250, 250, 253),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 20, top: 50),
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: txtEmailController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.green),
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 46, 107, 48)),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: txtPasswordController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mật khẩu',
                          labelStyle: const TextStyle(color: Colors.green),
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.visibility_off,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 46, 107, 48)),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),

                    Container(
                      width: 200,
                      height: 50,
                      margin: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 3, 165, 6)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text('Đăng Ký', style: TextStyle(fontSize: 28)),
                        onPressed: () async {
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential userCredential =
                          await auth.createUserWithEmailAndPassword(
                              email: txtEmailController.text, password: txtPasswordController.text);
                      if (userCredential.user != null) {
                        String uid = userCredential.user!.uid;

                        ref.child(uid).set({
                          'email': txtEmailController.text,
                          'password': txtPasswordController.text,
                          'name':"",
                          'uid': uid
                        });
                        Navigator.pop(context, 'Đăng Ký Thành Công!');
                      } else {
                        final snackBar = SnackBar(
                            content: Text('Tài khoản này không hợp lệ!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } catch (e) {
                      final snackBar =
                          SnackBar(content: Text('Có lỗi xảy ra!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
