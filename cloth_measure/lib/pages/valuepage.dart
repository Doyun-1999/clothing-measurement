import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class valuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('처리 결과'),
      ),
      body: Center(
        child: FutureBuilder<Widget>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );// 홈으로 가기 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
              },
            ),
            Text('홈으로 가기'),
          ],
        ),
      ),
    );
  }
}

Future<Widget> fetchData() async {
  final response = await http.get(
      Uri.parse('http://13.209.246.136/script.php'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    // Table 위젯을 사용하여 데이터를 화면에 표시
    return DataTable(
      columns: [
        DataColumn(label: Text('항목')),
        DataColumn(label: Text('값')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('총장')),
          DataCell(Text('${data[0]['damA']}cm')),
        ]),
        DataRow(cells: [
          DataCell(Text('가슴 단면')),
          DataCell(Text('${data[0]['damB']}cm')),
        ]),
        DataRow(cells: [
          DataCell(Text('어깨 단면')),
          DataCell(Text('${data[0]['damD']}cm')),
        ]),
        DataRow(cells: [
          DataCell(Text('소매 길이')),
          DataCell(Text('${data[0]['damE']}cm')),
        ]),
      ],
    );

  } else {
    // HTTP 요청 실패 시의 처리
    return Text('데이터를 불러오지 못했습니다');
  }
}
