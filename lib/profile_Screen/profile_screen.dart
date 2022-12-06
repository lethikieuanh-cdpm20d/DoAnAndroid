


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
   
}

class ProfileScreenState extends State<ProfileScreen>{
  String? name = '';
  String? email = '';
  String? date = '';
  //String? image = '';
  //File? imageXFile;
  final _auth = FirebaseAuth.instance;

  Future _getDataFromDatabase() async{
    await FirebaseFirestore.instance.collection("users")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get()
    .then((snapshot) async {
      if (snapshot.exists){
        setState(() {
         name = snapshot.data()!["name"];
         email = snapshot.data()!["email"];
         date = snapshot.data()!["date"];
         //image = snapshot.data()!["userImage"];
        });
      }
    });
  }

@override
void initState(){
  super.initState();
  _getDataFromDatabase();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.deepOrange.shade300
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.2, 0.9],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
        title: const Center(
          child: Text('Thông tin cá nhân ',style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.deepOrange.shade300
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.2, 0.9],
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {

              },
              child: const CircleAvatar(
                backgroundColor: Colors.amberAccent,
                minRadius: 60.0, 
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tên : ${name!}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
                IconButton(onPressed: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => editScreen()));
                }, 
                icon: const Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
              Text('Email: ${email!}',
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                ),
                const SizedBox( height: 10.0,),
                Text('Ngày sinh: ${date!}',
                style: const TextStyle(fontSize: 20.0,
                color: Colors.white,
                ),)
          ],
        ),
      ),
    );
  }

}