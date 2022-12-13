import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/invite.dart';
import 'package:flutter_application_1/list_banbe/banbe_object.dart';
import 'package:flutter_application_1/list_banbe/nguoidung_object.dart';

class ListFriend extends StatefulWidget {
  @override
  _ListFriendState createState() => _ListFriendState();
}

class _ListFriendState extends State<ListFriend> {
  final ref = FirebaseDatabase.instance.ref();
  List<BanBeObject> lsBanBe = [];
  List<UserObject> lsNguoiDung = [];
  List<UserObject> lsNguoiDung2 = [];
  List<UserObject> lsTimKiem = [];
  String uidUser = '';
  String FullNameUser = '';
  int abc = 0;
  TextEditingController strSearch = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Truy xuất dữ liệu bạn bè
    retrieveBanBeData();
    // Truy xuất dữ liệu người dùng
    retrieveBanBeData2();
    retrieveUserData();
    hienThongTin();
    if (mounted) {
      setState(() {});
    }
  }

  void retrieveBanBeData() {
    ref.child("BanBe").onChildAdded.listen((data) {
      BanBeObject BanBeObject1 =
          BanBeObject.formJson(data.snapshot.value as Map);
      lsBanBe.add(BanBeObject1);
      if (mounted) {
        setState(() {});
      }
    });
  }

  void hienThongTin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
  }

  layFullName() {
    String fullname = "";
    for (int i = 0; i < lsNguoiDung2.length; i++) {
      if (lsNguoiDung2[i].uid == uidUser) {
        fullname = lsNguoiDung2[i].FullName.toString();
      }
    }
    return fullname;
  }

  void insertData(int LoaiThongBao, String NoiDung, int TrangThai, String uid1,
      String uid2) {
    ref.child("ThongBao").push().set({
      'LoaiThongBao': LoaiThongBao,
      'NoiDung': NoiDung,
      'TrangThai': TrangThai,
      'uid1': uid1,
      'uid2': uid2,
    });
  }

  void retrieveUserData() {
    ref.child("Users").onChildAdded.listen((data) {
      for (int i = 0; i < lsBanBe.length; i++) {
        if (data.snapshot.child("uid").value.toString() ==
                lsBanBe[i].NguoiDung2.toString() &&
            lsBanBe[i].NguoiDung1 == uidUser) {
          UserObject UserObject1 =
              UserObject.formJson(data.snapshot.value as Map);
          lsNguoiDung.add(UserObject1);
        }
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  void retrieveBanBeData2() {
    ref.child("Users").onChildAdded.listen((data) {
      UserObject UserObject1 = UserObject.formJson(data.snapshot.value as Map);
      lsNguoiDung2.add(UserObject1);
      if (mounted) {
        setState(() {});
      }
    });
  }

  Widget appBarTitle = const Text(
    'Bạn Bè',
    style: TextStyle(
      fontSize: 30,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 224, 93),
        centerTitle: true,
        title: appBarTitle,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              constraints: BoxConstraints(maxHeight: 150),
              child: Material(
                color: Color.fromARGB(255, 17, 224, 93),
                child: TabBar(
                  tabs: [
                    Row(
                      children: [
                        Icon(Icons.people),
                        Text(
                          'Danh Sách',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.sports_esports_rounded),
                        Text(
                          'Thách Đấu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(children: [
                      Icon(Icons.delete_rounded),
                      SizedBox(width: 5),
                      Text(
                        "Kết Bạn",
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ],
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  ),
                  indicatorColor: Colors.deepOrange,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //danh sách
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(2)),
                      Row(
                        children: [
                          Container(
                            color: Colors.blue,
                            height: 40,
                            width: 390,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 100, bottom: 10)),
                                    Text('Tên',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 150, bottom: 10)),
                                    Text('Trạng thái',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 400,
                        height: 380,
                        child: ListView.builder(
                          itemCount:
                              lsNguoiDung.length != 0 ? lsNguoiDung.length : 0,
                          itemBuilder: (context, index) => Row(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 130, bottom: 15)),
                                        Text(
                                            lsNguoiDung.length != 0
                                                ? lsNguoiDung[index]
                                                    .FullName
                                                    .toString()
                                                : '',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 140, bottom: 15)),
                                        Text(
                                            lsNguoiDung.length != 0
                                                ? 'online'
                                                : '',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 17))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 110, bottom: 15)),
                                        Text(
                                            lsNguoiDung.length != 0
                                                ? 'Xem thêm'
                                                : '',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.underline))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //thách đấu
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(2)),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 100, bottom: 15)),
                                    Text('Kiều Anh',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 150, bottom: 15)),
                                    Text('online',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InviteChallengeScreen()));
                                        },
                                        child: const Text('Thách đấu'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 100, bottom: 20)),
                                    Text('Đức Quyền',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 150, bottom: 20)),
                                    Text('online',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InviteChallengeScreen()));
                                        },
                                        child: const Text('Thách đấu'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 100, bottom: 20)),
                                    Text('Quang Phúc',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 150, bottom: 20)),
                                    Text('online',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InviteChallengeScreen()));
                                        },
                                        child: const Text('Thách đấu'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //xóa bạn
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: strSearch,
                          decoration: InputDecoration(
                            labelText: 'Nhập tên người bạn muốn tìm',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                          ),
                          onChanged: (value) {
                            if (strSearch.text != null) {
                              for (int i = 0; i < lsNguoiDung2.length; i++) {
                                if (lsNguoiDung2[i]
                                    .FullName
                                    .toLowerCase()
                                    .contains(strSearch.text)) {
                                  lsTimKiem.add(lsNguoiDung2[i]);
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              }
                              for (int i = 0; i < lsNguoiDung2.length; i++) {
                                abc = 0;
                                for (int j = 0; j < lsTimKiem.length; j++) {
                                  if (lsNguoiDung2[i].uid == lsTimKiem[j].uid) {
                                    abc++;
                                  }
                                  if (abc == 2) {
                                    lsTimKiem.removeAt(j);
                                  }
                                }
                              }
                              if (mounted) {
                                setState(() {});
                              }
                            }
                            if (strSearch.text.isEmpty) {
                              lsTimKiem = [];
                              lsTimKiem.remove(true);
                              if (mounted) {
                                setState(() {});
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Colors.white12,
                        ),
                        child: ListView.builder(
                          itemCount:
                              lsTimKiem.length != 0 ? lsTimKiem.length : 0,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              title: Text(lsTimKiem[index].FullName.toString()),
                              subtitle: Column(
                                children: [
                                  Text(lsTimKiem[index].Email.toString()),
                                  Text(lsTimKiem[index].uid.toString()),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.add_circle),
                                color: Colors.blue,
                                iconSize: 30,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Gửi kết bạn'),
                                          content: const Text(
                                              'Bạn có chắc sẽ gửi lời mời kết bạn cho người này?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Hủy'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                insertData(
                                                    1,
                                                    layFullName().toString() +
                                                        ' gửi bạn lời mời kết bạn',
                                                    0,
                                                    uidUser,
                                                    lsTimKiem[index]
                                                        .uid
                                                        .toString());
                                                Navigator.pop(context);
                                              },
                                              child: const Text('ok'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
