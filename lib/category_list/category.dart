import 'package:flutter/material.dart';
import 'package:flutter_application_1/category_list/categoryregime_IQ.dart';
import 'package:flutter_application_1/category_list/categoryregime_environment.dart';
import 'package:flutter_application_1/category_list/categoryregime_happy.dart';
import 'package:flutter_application_1/category_list/categoryregime_healthy.dart';
import 'package:flutter_application_1/category_list/categoryregime_history.dart';
import 'package:flutter_application_1/category_list/categoryregime_music.dart';
import 'package:flutter_application_1/category_list/categoryregime_ocean.dart';
import 'package:flutter_application_1/category_list/categoryregime_plant.dart';
import 'package:flutter_application_1/category_list/categoryregime_rivers.dart';

class categoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(children: [
              Card(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => categoryRegimeScrennIQ()));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset('images/iq.png',
                            width: 500, height: 100, fit: BoxFit.fill),
                      ),
                      const Text('Câu hỏi IQ'),
                    ],
                  ),
                ),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennMusic()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/music.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Âm Nhạc'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennHappy()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/dovui.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi vui'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennHealthy()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/healthy.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Sức Khỏe'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennHistory()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/history.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Lịch Sử'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennEnviroment()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/mt.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Môi Trường'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennOcean()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/ocean.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Đại Dương'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennRivers()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/rivers.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Sông Ngòi'),
                      ],
                    )),
              ),
              Card(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  categoryRegimeScrennPlant()));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset('images/tv.png',
                              width: 500, height: 100, fit: BoxFit.fill),
                        ),
                        const Text('Câu hỏi Thực Vật'),
                      ],
                    )),
              )
            ]);
          }),
    );
  }
}
