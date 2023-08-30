import 'package:flutter/material.dart';

import '../screens/camera_screen.dart';


class Camerapage extends StatefulWidget {
  const Camerapage({Key? key}) : super(key: key);

  @override
  State<Camerapage> createState() => Camerapage_State();
}

class Camerapage_State extends State<Camerapage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Align(
        alignment: Alignment(0,-0.7),
        child: Column(
            children: [
              Image.asset('assets/images/clothicon.PNG'),
              Text('정확한 측정을 위해',style:TextStyle(fontSize: 24)),
              Text('유의사항을 확인해주세요',style:TextStyle(fontSize: 24,color:Colors.blueAccent)),
              SizedBox(height: 16),
              Text('1.의류를 중심선에 맞추어 촬영 해 주세요!'),
              SizedBox(height: 10),
              Text('2.그림자에 유의하여 촬영 해 주세요!'),
              SizedBox(height: 10),
              Text('3.배경 색과 옷의 색이 겹치지 않는 곳에서 촬영 해 주세요!'),
              SizedBox(height: 10),
              Text('4.지면과 카메라가 수평이 되도록 찍어주세요!'),
              SizedBox(height: 25),
              ElevatedButton(
              onPressed: () {
              Navigator.push(
                  context,

                MaterialPageRoute(builder: (context) => CameraScreen()),
              );
            },
            child: Text('측정 바로 시작'),

              )
            ]
      ),
    ),
    );
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text('측정'),
    );
  }
}