import 'dart:io';

import 'package:flutter/material.dart';
import 'package:clothing_measurement/screens/captures_screen.dart';
import 'package:clothing_measurement/pages/successpage.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';



class PreviewScreen extends StatelessWidget {
  final File imageFile;
  final List<File> fileList;

  const PreviewScreen({
    required this.imageFile,
    required this.fileList,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            CapturesScreen(
                              imageFileList: fileList,
                            ),
                      ),
                    );
                  },
                  child: Text('사진첩'),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadImage(imageFile, context); // 이미지 파일 전송
                  },
                  child: Text('치수 측정'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.file(imageFile),
          ),
        ],
      ),
    );
  }


  Future uploadImage(File imageFile, BuildContext context) async {
    final url = Uri.parse("http://13.209.246.136/user/img/upload.php");
    final request = http.MultipartRequest('POST', url);
    final fileName = '${DateTime.now().toIso8601String()}.jpg'; // 새 파일 이름 설정
    request.files.add(
        await http.MultipartFile.fromPath('file', imageFile.path,
            filename: fileName)); // 새 파일 이름 전달

    final response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "파일 전송 성공",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SuccessPage())
        );
      });
      // 두개의 Navigator 충돌로 delay 후 작업

    } else {
      print('서버 응답 코드: ${response.statusCode}');
      Fluttertoast.showToast(
          msg: "파일 전송 실패",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
