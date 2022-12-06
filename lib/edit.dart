
import 'package:flutter/material.dart';

class editScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget editForm = Form(child:
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: TextFormField(
            decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Tên thay đổi ',
            labelText: 'Tên hiển thị',
          ),
          ),
          
        ),
        Container(
          child: TextFormField(
            decoration: InputDecoration(
            icon: Icon(Icons.email_outlined),
            hintText: 'Thay đổi email',
            labelText: 'Email',
          ),
          ),
        ),
        Container(
          child: TextFormField(
            decoration: InputDecoration(  
            icon: Icon(Icons.calendar_today),
            hintText: 'Thay đổi ngày sinh',
            labelText: 'Ngày sinh'
          )
        ),
        ),
        Container(
          child: TextFormField(
            decoration: InputDecoration(  
            icon: Icon(Icons.password_outlined),
            hintText: 'Thay đổi mật khẩu',
            labelText: 'Mật Khẩu'
          )
        ),
        ),
         Container(
          padding: const EdgeInsets.only(left: 20.0, top: 40.0),
          child: const ElevatedButton(
            child: Text('Lưu'),
            onPressed: null,
          ),
        )
      ],
    ));
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
      body: Column(
        children: [
          Container(
            child: editForm,
          )
        ],
      ),
   );
  }
}
 