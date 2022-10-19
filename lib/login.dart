

import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';

import 'forget.dart';
import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController txtUsernameController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  String _username='abc';
  String _password='123456789';
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('images/login2.png',width:250, height: 250,),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: txtUsernameController,
              decoration: InputDecoration(
                labelText: 'Tên đăng nhập',
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
              controller: txtPasswordController,
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
              onPressed: () {
                if (txtUsernameController.text.isEmpty ||
                    txtPasswordController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'Tên đăng nhập hoặc mật khẩu không hợp lệ'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                }
                else if(txtPasswordController.text==_password&&txtUsernameController.text==_username){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => homepageScreeen()));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 14, 234, 76),
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
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signupScreen()));
                      },
                      child: const Text('Đăng ký',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    const Text('ngay !!!', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
