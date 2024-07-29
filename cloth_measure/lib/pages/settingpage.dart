import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/accountService.dart';
import 'favorite.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
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
