import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return signupScreenState();
  }
}

class signupScreenState extends State<signupScreen> {
  TextEditingController txtPasswordController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
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
                        style: TextStyle(
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
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Nhập mật khẩu',
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
                            final newUser =
                                _auth.createUserWithEmailAndPassword(
                              email: txtEmailController.text,
                              password: txtPasswordController.text,
                            );
                            if (newUser != null) {
                              Navigator.pop(context, 'Đăng Ký Thành Công !!');
                            } else {
                              final snackBar = SnackBar(
                                  content: Text('Tài Khoản Này Không Hợp Lệ!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } catch (e) {
                            final snackBar =
                                SnackBar(content: Text('Có Lỗi Xảy Ra'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
                          'Đăng Ký Ngay',
                        ),
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
