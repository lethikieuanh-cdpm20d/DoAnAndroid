import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signupScreen extends StatelessWidget {
  TextEditingController txtPasswordController = TextEditingController();
  TextEditingController txtReEnterPasswordController = TextEditingController();
  TextEditingController txtUsernameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: Center(
        
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
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtReEnterPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu',
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
              child: TextField(
                controller: txtEmailController,
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
              child: ElevatedButton(
                onPressed: () {
                  if (txtUsernameController.text.isEmpty ||
                      txtPasswordController.text.isEmpty ||
                      txtReEnterPasswordController.text.isEmpty ||
                      txtEmailController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content:
                                const Text('Vui lòng điền đầy đủ thông tin'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  } else if (txtPasswordController.text.length < 8 ||
                      txtPasswordController.text.length > 16) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'Mật khẩu của bạn phải dài từ 8 đến 16 ký tự'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  } else if (txtPasswordController !=
                      txtReEnterPasswordController) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Mật khẩu xác nhận không khớp'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 234, 76),
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
      ),
    );
  }
}
