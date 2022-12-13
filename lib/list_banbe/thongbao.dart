import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/list_banbe/thongbao_object.dart';

class ThongBao_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Thông Báo",
      home: ThongBao_Home(),
    );
  }
}

class ThongBao_Home extends StatefulWidget {
  @override
  State<ThongBao_Home> createState() => ThongBao_State();
}

class ThongBao_State extends State<ThongBao_Home> {
  final ref = FirebaseDatabase.instance.ref();
  List<ThongBaoObject> lsthongbao = [];
  List<ThongBaoObject> lsthongbao2 = [];
  String uidUser = '';
  @override
  void initState() {
    super.initState();
    // Truy xuất dữ liệu Thông báo
    //retrieveThongBaoData();
    hienThongTin();
    retrieveThongBaoData2();
    if (mounted) {
      setState(() {});
    }
  }

  void hienThongTin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
  }

  void insertData(String NguoiDung1, String NguoiDung2) {
    ref.child("BanBe").push().set({
      'NguoiDung1': NguoiDung1,
      'NguoiDung2': NguoiDung2,
    });
  }

  void deleteData(String vitri) {
    ref.child("ThongBao").child(vitri).remove();
    if (mounted) {
      setState(() {});
    }
  }

  void retrieveThongBaoData() {
    ref.child("ThongBao").onChildAdded.listen((data) {
      ThongBaoObject ThongBaoObject1 =
          ThongBaoObject.formJson(data.snapshot.value as Map);
      lsthongbao.add(ThongBaoObject1);
      if (mounted) {
        setState(() {});
      }
    });
  }

  void retrieveThongBaoData2() {
    ref.child("ThongBao").onChildAdded.listen((data) {
      if (data.snapshot.child("uid2").value.toString() == uidUser &&
          data.snapshot.child("TrangThai").value == 0) {
        ThongBaoObject ThongBaoObject1 =
            ThongBaoObject.formJson(data.snapshot.value as Map);
        lsthongbao2.add(ThongBaoObject1);
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//======================================================//
    Widget headSection = Container(
      child: Row(
        children: [
          Container(
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              //Xử lý trở về trang chủ
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => homepageScreenHome()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80),
            child: const Text(
              "Thông báo",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
//======================================================//
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.blue,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 15,
        bottom: 15,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );

//========================================================//
    Widget optionSection = Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {}, // Chưa xử lý
              child: const Text(
                'Tất cả',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {}, // Chưa xử lý
              child: const Text(
                'Chưa đọc',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
//======================================================//
    Widget contentSection = Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 400,
            height: 600,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.white12,
            ),
            child: ListView.builder(
              itemCount: lsthongbao2.length != 0 ? lsthongbao2.length : 0,
              itemBuilder: (context, index) => Card(
                color: Colors.grey[300],
                margin: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: ListTile(
                  title: Text(
                    lsthongbao2.length != 0
                        ? lsthongbao2[index].NoiDung.toString()
                        : '',
                    //'User đã gửi Yêu cầu thách đấu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  // subtitle: const Text(
                  //   '1 phút trước',
                  //   style: TextStyle(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {
                            insertData(lsthongbao2[index].uid2,
                                lsthongbao2[index].uid1);
                            insertData(lsthongbao2[index].uid1,
                                lsthongbao2[index].uid2);
                            //deleteData();
                          }, // Chưa xử lý
                          child: Text(
                            'Chấp nhận',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.green),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {}, // Chưa xử lý
                          child: const Text(
                            'Từ chối',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
//======================================================//
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            headSection,
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              optionSection,
              contentSection,
            ],
          ),
        ),
      ),
    );
  }
}
