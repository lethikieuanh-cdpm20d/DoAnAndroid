import 'package:flutter/material.dart';

class forgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 50),
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 15, top: 20),
                      child: const Text(
                          'Vui lòng điền tên đăng nhập bạn sử dụng để đăng nhập')),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
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
                      padding: const EdgeInsets.only(
                        right: 60,
                      ),
                      child: const Text(
                          'Vui lòng điền tên email bạn sử dụng để đăng ký')),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 14, 234, 76),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text(
                        'Xác nhận',
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
