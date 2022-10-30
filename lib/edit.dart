


import 'package:flutter/material.dart';

class editScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        centerTitle: true,//căn giữa
        title: const Text(
          'Chỉnh sửa trang cá nhân',
          style: TextStyle(color: Color.fromARGB(255, 248, 244, 244),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
   );
  }
}

class ContactTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ContactTabState();
  }
}

class ContactTabState extends State<ContactTab>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('N'),
              ),
              title: Text('Tên:'),
              subtitle: Text(''),
              trailing: null,
            ),
          )
        ],
      ),
    );
  }

}