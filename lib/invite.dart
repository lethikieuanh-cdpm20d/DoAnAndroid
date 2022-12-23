import 'package:flutter/material.dart';

class InviteChallengeScreen extends StatefulWidget {
  const InviteChallengeScreen({super.key});

  @override
  State<InviteChallengeScreen> createState() => _InviteChallengeScreenState();
}

class _InviteChallengeScreenState extends State<InviteChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thách Đấu'),
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: Container(
        width: 400,
        height: 380,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 130, bottom: 15)),
                        Text('Quang Phúc',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 140, bottom: 15)),
                        Text('Online',
                            style: TextStyle(color: Colors.green, fontSize: 17))
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 110, bottom: 15)),
                        Text('Xem Thêm',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                decoration: TextDecoration.underline))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
