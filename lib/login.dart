import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor:const Color.fromARGB(255, 17, 224, 93),
      ),
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'images/login2.png',
            ),
          ),
        ),
      ),
          Container(
            padding: const EdgeInsets.all(15),
            child:  TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 7, 7, 7)),
                          borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Container(
            padding:  const EdgeInsets.all(15),
            child:  TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.visibility_off),
                enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color.fromARGB(255, 7, 7, 7)),
                          borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
             
              onPressed: () {},
            style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 14, 234, 76),
            minimumSize: const Size(140, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),//bo sung 2
            child: const Text('Đăng Nhập',
            ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {}, //bo sung 3
                  child: const Text (
                    'Quên Mật Khẩu ?',style: TextStyle(fontSize: 15),
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Chưa có tài khoản',style:TextStyle(fontSize: 15) ,),
                        TextButton(
                          onPressed: () {}, //bo sung 4
                          child: const Text (
                            'Đăng ký',style:TextStyle(fontSize: 15,)
                   ),
                 ),
                 const Text('ngay !!!',style:TextStyle(fontSize: 15)),
                      ],
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
