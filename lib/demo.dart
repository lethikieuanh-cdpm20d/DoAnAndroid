import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class kqScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  Widget khung =SizedBox(
    height: 50,
    width: 100,
    child: Container(
    color: Colors.red,
    
    ),
  );
   return Scaffold(
    body: Container
    (child: Column(children: [khung],)),
   );
  }

}