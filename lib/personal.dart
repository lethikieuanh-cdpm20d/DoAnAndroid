import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

class personalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,//căn giữa
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Color.fromARGB(255, 248, 244, 244),
          ),  
        ),
 actions: <Widget>[
    IconButton(
      icon: const Icon(
        Icons.home_outlined,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {
         Navigator.push(context,
                     MaterialPageRoute(builder: (context) => homepageScreeen()));
       },
    )
  ],
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
       
      ),
    );
  }
}