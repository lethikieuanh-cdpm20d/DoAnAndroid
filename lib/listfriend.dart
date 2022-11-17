//import 'dart:js';

import 'package:flutter/material.dart';

class ListFriend extends StatefulWidget {
  @override
  _ListFriendState createState() => _ListFriendState();
}

class _ListFriendState extends State<ListFriend> {
  Widget appBarTitle = Text(
    'Bạn Bè',
    style: TextStyle(
      fontSize: 35,
    ),
  );
  Icon actionIcon = Icon(
    Icons.person_add,
    size: 35,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: actionIcon,
          )
        ],
        backgroundColor: Color.fromARGB(255, 17, 224, 93),
        centerTitle: true,
        title: appBarTitle,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Tìm Kiếm',
                labelStyle: const TextStyle(
                  color: Colors.green,
                ),
                border: OutlineInputBorder(),
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
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('P'),
                ),
                title: Text('Quang Phuc'),
                subtitle: Text('Nguoi choi dang hoat dong'),
                trailing: _PopupMenu(),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('Q'),
                ),
                title: Text('Duc Quyen'),
                subtitle: Text('Nguoi choi dang hoat dong'),
                trailing: _PopupMenu(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _PopupMenu() {
  return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.whatshot_rounded),
                title: Text(
                  'Mời Thách đấu',
                  style: TextStyle(),
                ),
                subtitle: Text('Thách đấu '),
                onTap: () {},
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('Xóa Bạn bè'),
                subtitle: Text('Xóa'),
                onTap: () {},
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.block),
                title: Text('Chặn bạn bè'),
                subtitle: Text('Chặn'),
                onTap: () {},
              ),
            ),
          ]);
}
