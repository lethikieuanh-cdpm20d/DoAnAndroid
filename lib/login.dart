import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';

import 'forget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  bool _isObscure = true;
  final _auth = FirebaseAuth.instance;

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/login2.png',
                    width: 250,
                    height: 250,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: txtUserName,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Nhập Email Bạn Đã Đăng Ký !',
                        labelStyle: const TextStyle(color: Colors.green),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.person,
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
                      controller: txtPass,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      obscureText: _isObscure,
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
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final _user = await _auth.signInWithEmailAndPassword(
                              email: txtUserName.text, password: txtPass.text);
                          await _auth.authStateChanges().listen((event) {
                            if (event != null) {
                              txtUserName.clear();
                              txtPass.clear();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                'home',
                                (route) => false,
                              );
                            } else {
                              final snackBar = SnackBar(
                                content:
                                    Text('Email hoặc mật khẩu không đúng!! '),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        } catch (e) {
                          final snackBar = SnackBar(
                            content: Text('Lỗi kết nối với Server '),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 14, 234, 76),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text(
                        'Đăng Nhập',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgetScreen()));
                          },
                          child: const Text(
                            'Quên Mật Khẩu ?',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Chưa có tài khoản',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            signupScreen())).then((value) {
                                  if (value != null) {
                                    final snackBar =
                                        SnackBar(content: Text(value));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                });
                              },
                              child: const Text('Đăng ký',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            const Text('ngay !!!',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
