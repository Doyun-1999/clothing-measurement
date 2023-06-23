import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/accountService.dart';
import 'favorite.dart';

import 'package:flutter/material.dart';

import 'favorite.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: imageHeight,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/playstore.png'),
            ),
          ),
          ListTile(
            onTap: () {
              // 계정 관리 버튼이 눌렸을 때 수행할 작업
            },
            leading: Icon(Icons.account_circle),
            title: Text('계정 관리'),
          ),
          Divider(),
          ListTile(
            onTap: () async {
              final client = http.Client();
              final userId = '사용자 ID';
              final accountService = AccountService();
              final itemFavorites = await accountService.fetchItemFavorites(client, userId);
              // 관심 상품 정보를 화면에 출력하는 코드
            },
            leading: Icon(Icons.favorite),
            title: Text('관심 목록'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              // 알림 버튼이 눌렸을 때 수행할 작업
            },
            leading: Icon(Icons.notifications),
            title: Text('알림'),
          ),
        ],
      ),
    );
  }
}
