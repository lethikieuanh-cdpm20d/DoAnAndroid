import 'package:flutter/material.dart';

class ListFriend extends StatefulWidget {
  @override
  _ListFriendState createState() => _ListFriendState();
}

class _ListFriendState extends State<ListFriend> {
  Widget appBarTitle = const Text(
    'Bạn Bè',
    style: TextStyle(
      fontSize: 35,
    ),
  );
  Icon actionIcon = const Icon(
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
                labelText: 'Tim kiem',
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
                leading: const CircleAvatar(
                  child: Text('P'),
                ),
                title: const Text('Quang Phuc'),
                subtitle: const Text('Nguoi choi dang hoat dong'),
                trailing: _PopupMenu(),
              ),
            ),
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Text('Q'),
                ),
                title: const Text('Duc Quyen'),
                subtitle: const Text('Nguoi choi dang hoat dong'),
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
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(Icons.whatshot_rounded),
                title: const Text(
                  'Mời Thách đấu',
                  style: TextStyle(),
                ),
                subtitle: const Text('Thách đấu '),
                onTap: () {},
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Xóa Bạn bè'),
                subtitle: const Text('Xóa'),
                onTap: () {},
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(Icons.block),
                title: const Text('Chặn bạn bè'),
                subtitle: const Text('Chặn'),
                onTap: () {},
              ),
            ),
          ]);
}
