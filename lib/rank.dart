import 'package:flutter/material.dart';

class rankSreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // Widget title = Container(
    //  decoration: BoxDecoration(
    //    image: DecorationImage(
    //         image: AssetImage('images/rating.png'), fit: BoxFit.contain),
    //   ),
    //   child: Row(
    //     children: [
    //       Container(
    //          child: const CircleAvatar(
    //           radius: 30,
    //           child: Image(
    //             image: AssetImage('images/login.png'),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
       
    //     ],
    //   ),
    // );
    Widget ranking = Container(
      margin: EdgeInsets.only(top: 5),
      width: 410,
      height: 70,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 148, 242, 181),
            Color.fromARGB(255, 132, 224, 137),
            Color.fromARGB(255, 128, 221, 134),
            Color.fromARGB(255, 38, 225, 94),
            Color.fromARGB(255, 73, 226, 101),
            Color.fromARGB(255, 16, 183, 63),
            Color.fromARGB(255, 5, 184, 23),
          ],
        ),
        //border: Border.all(width: 2, color: Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: const Text(
              '',
              style: TextStyle(
                fontSize: 45,
                fontFamily: 'Fraunces',
                color: Color(0xFFFC5658),
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Color(0xFFFf0099),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: const CircleAvatar(
              radius: 40,
              child: Image(
                image: AssetImage('images/rank.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: const Text(
              'Trương Đức Quyền',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Fraunces',
                color: Color(0xFFC238D3),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 75,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              //color: Colors.orange,
              border: Border(
                left: BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
            child: const Text(
              '500',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Fraunces',
                color: Color(0xFFFf0099),
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(  
         centerTitle: true,//căn giữa
        title: const Text(
          'Bảng xếp hạng',
          style: TextStyle(color: Color.fromARGB(255, 248, 244, 244),
          ),
        ),
        backgroundColor: Colors.green,
      ),
     
      body: Container(
        child: Column(
          children: [
            Container(
              
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20),                  
                itemCount: 10,
                itemBuilder: (context, index) => ranking,
              ),
            ),
          ],
        ),
      ),
    );
     
  }
}
