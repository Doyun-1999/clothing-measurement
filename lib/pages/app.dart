import 'package:flutter/material.dart';
import 'package:clothing_measurement/pages/Camerapage.dart';
import 'package:clothing_measurement/pages/settingpage.dart';

import 'package:clothing_measurement/provider/navigation_provider.dart';
import 'package:provider/provider.dart';
import '../provider/chat.dart';

import 'home.dart';
import 'chat.dart'; // Import the chat page

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late int _navigationBar;
  int _currentPageIndex = 0;

  Widget _bodyWidget() {
    switch (_navigationBar) {
      case 0:
        return Home();
      case 1:
        return Camerapage();
      case 2:
        return ChatPage();
      case 3:
        return SettingPage();; // Navigate to the ChatPage when index is 3

    }
    return Container();
  }

  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPageIndex,
      onTap: (index) {
        setState(() {
          _currentPageIndex = index;
        });
        if (index == 2) { // Check if the "채팅" button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()), // Navigate to the ChatPage
          );
        } else if (index == 3) { // Check if the "설정" button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingPage()), // Navigate to the MyCarrot page
          );
        } else if (index == 1) { // Check if the "측정" button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Camerapage()), // Navigate to the Camerapage
          );
        }
      },
      selectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        _bottomNavigationBarItem(Icon(Icons.home, size: 22), "홈"),
        _bottomNavigationBarItem(Icon(Icons.camera, size: 22), "측정"),
        _bottomNavigationBarItem(Icon(Icons.chat, size: 22), "채팅"),
        _bottomNavigationBarItem(Icon(Icons.settings, size: 22), "설정"),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      Widget icon, String name) {
    return BottomNavigationBarItem(
      icon: icon,
      label: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    _navigationBar =
        Provider.of<NavigationProvider>(context).currentNavigationIndex;

    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationWidget(),
    );
  }
}
