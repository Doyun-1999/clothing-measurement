import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:clothing_measurement/pages/valuepage.dart';
=======
import 'package:getx_mysql_tutorial/pages/valuepage.dart';
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104

import '../screens/camera_screen.dart';

class ImageFromUrl extends StatefulWidget {
  final String imageUrl;

  ImageFromUrl({required this.imageUrl});

  @override
  _ImageFromUrlState createState() => _ImageFromUrlState();
}

class _ImageFromUrlState extends State<ImageFromUrl> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('안내'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/cloth.png'),
                Text('측정 전에 의류의 외곽선을 확인해 주세요!'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(widget.imageUrl),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) => CameraScreen()), // 버튼이 눌렸을 때 수행할 작업
                  );
                },
                child: Text('재촬영 하기'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.lightBlue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => valuePage()),
                   ); // 버튼이 눌렸을 때 수행할 작업
                },
                child: Text('측정결과 확인'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.lightBlue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
