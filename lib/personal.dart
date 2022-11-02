import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/start.dart';

class personalScreen extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    Widget rowSection = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          child: const CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 50,
            child: Text('HN',
            style: TextStyle(color: Colors.greenAccent,
            fontSize: 20),
            ),
          ),
        ),
        Container(
           padding: const EdgeInsets.only(left: 0),
       child: const Text(
               'Lê Thị Kiều Anh ',
                style:
                     TextStyle(color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 25,
                     ),
               ),
           ),
           ],);
       Widget titleSection = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
             child: Row(children: [
            Container(
               padding: const EdgeInsets.only(left: 20),
              child: const Text('Tên hiển thị: ',
              style: TextStyle(color: Colors.black,
              fontSize: 20,
             
              ) ,),
          ),
             Container(
              child: const Text('Anh Anh',
               style: TextStyle(color: Colors.black,
               fontSize: 20,
               ),),
             ),
           ]),
          ),
          Container(
             child: Row(children: [
            Container(
               padding: const EdgeInsets.only(left: 20),
              child: const Text('Ngày sinh: ',
              style: TextStyle(color: Colors.black,
              fontSize: 20,height: 3
              ) ,),
          ),
             Container(
              child: const Text('06',
               style: TextStyle(color: Colors.black,
               fontSize: 20,height: 3),),
             ),
           ]),
          ),
          Container(
             child: Row(children: [
            Container(
               padding: const EdgeInsets.only(left: 20),
              child: const Text('Mật khẩu: ',
              style: TextStyle(color: Colors.black,
              fontSize: 20,height: 3,
              ) ,),
          ),
             Container(
              child: const Text('*******',
               style: TextStyle(color: Colors.black,
               fontSize: 20, height: 3),),
             ),
           ]),
          ),
          Container(
             child: Row(children: [
            Container(
               padding: const EdgeInsets.only(left: 20),
              child: const Text('Gmail: ',
              style: TextStyle(color: Colors.black,
              fontSize: 20,height: 3,
              ) ,),
          ),
             Container(
              child: const Text('12345@gmail.com',
               style: TextStyle(color: Colors.black,
               fontSize: 20, height: 3),),
             ),
           ]),
          ),
        ],
        );
   Widget buttunSection = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children: [
    Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        
        onPressed: (){
          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 14, 234, 76),
                  minimumSize: const Size(500, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
        ),
        child:  const Text('Chỉnh Sửa Thông Tin ')
     
      ),
    ),
      
      
   ],
   );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,//căn giữa
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Color.fromARGB(255, 248, 244, 244),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: Column(
        children: [
          Container(
            child: rowSection,
          ),
          Container(
            child: titleSection,
          ),
          Container(
            margin: const EdgeInsets.all(90),
            
            child: buttunSection,
          ),
        ],
      ),
      

    );
    
  }
}
