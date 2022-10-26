import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        centerTitle: true,//căn giữa
        title: const Text(
          'QuizzGame',
          style: TextStyle(color: Color.fromARGB(255, 248, 244, 244)),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
       
      ),

     body: Column(
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Tìm Kiếm ',
                labelStyle: const TextStyle(color: Colors.green),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(
                  Icons.search_outlined,
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
          ],
          
     ),
    ),
    );
  }
}
