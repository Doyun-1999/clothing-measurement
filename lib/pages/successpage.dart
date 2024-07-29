import 'package:clothing_measurement/pages/valuepage_pants.dart';
import 'package:flutter/material.dart';
import 'package:clothing_measurement/pages/valuepage.dart';

import '../screens/camera_screen.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool isLoading = false; // 로딩 상태를 나타내는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('측정 의류 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading ? CircularProgressIndicator() : SizedBox.shrink(), // 로딩 중일 때 로딩 인디케이터 표시
            Container(
              width: 150, // 버튼의 너비를 조정합니다.
              height: 150, // 버튼의 높이를 조정합니다.
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true; // 로딩 시작
                  });
                  await Future.delayed(Duration(seconds: 4)); // 4초 지연
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => valuePage()),
                  ); // 반팔티 측정 버튼이 눌렸을 때 수행할 작업
                  setState(() {
                    isLoading = false; // 로딩 종료
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/shorts_sleeve.png'), // PNG 파일
                ),
              ),
            ),
            SizedBox(height: 10), // 텍스트를 아래로 조금 더 내립니다.
            Text('반팔', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), // 글꼴을 굵게 하고 글자 크기를 키웁니다.
            SizedBox(height: 50), // Add some spacing
            Container(
              width: 150, // 버튼의 너비를 조정합니다.
              height: 150, // 버튼의 높이를 조정합니다.
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true; // 로딩 시작
                  });
                  await Future.delayed(Duration(seconds: 4)); // 4초 지연
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => valuePage2()),
                  ); // 반바지 측정 버튼이 눌렸을 때 수행할 작업
                  setState(() {
                    isLoading = false; // 로딩 종료
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/shorts.png'), // PNG 파일
                ),
              ),
            ),
            SizedBox(height: 10), // 텍스트를 아래로 조금 더 내립니다.
            Text('반바지', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), // 글꼴을 굵게 하고 글자 크기를 키웁니다.
          ],
        ),
      ),
    );
  }
}
