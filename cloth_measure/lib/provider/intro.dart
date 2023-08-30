import 'dart:async';

<<<<<<< HEAD
import 'package:clothing_measurement/components/splash_widget.dart';
import 'package:clothing_measurement/pages/app.dart';
=======
import 'package:getx_mysql_tutorial/components/splash_widget.dart';
import 'package:getx_mysql_tutorial/pages/app.dart';
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Splash 위젯 표시
          SplashWidget()
        ],
      )),
    );
  }

  Future<Timer> _loadData() async {
    // 약 3초 후 App 페이지로 이동
    return Timer(Duration(seconds: 3), _onDoneLoading);
  }

  _onDoneLoading() async {
    // 기타 필수 기초 데이터 로딩 및 선 처리 작업
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => App()));
  }
}
