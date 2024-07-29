import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];
  TextEditingController textEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();

  String userName = '';
  String selectedUser = '';

  void sendMessage(String text) {
    setState(() {
      final message = Message(
        text: text,
        sender: userName,
        time: DateTime.now(),
      );
      messages.add(message);
      textEditingController.clear();
    });
  }

  void setName() {
    setState(() {
      userName = nameEditingController.text;
    });
  }

  void selectUser(String user) {
    setState(() {
      selectedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userName.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            '채팅',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '채팅방 목록',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  selectUser('User 1');
                },
                child: Text('User 1'),
              ),
              TextButton(
                onPressed: () {
                  selectUser('User 2');
                },
                child: Text('User 2'),
              ),
              TextButton(
                onPressed: () {
                  selectUser('User 3');
                },
                child: Text('User 3'),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            '1대1 채팅',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isMe = message.sender == userName;
                  final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
                  final bgColor = isMe ? Colors.blue[100] : Colors.grey[300];
                  final textColor = isMe ? Colors.black : Colors.black87;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: align,
                      children: [
                        Text(
                          message.sender,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${message.time.hour}:${message.time.minute}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: '메시지를 입력하세요',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        String message = textEditingController.text;
                        if (message.isNotEmpty) {
                          sendMessage(message);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class Message {
  final String text;
  final String sender;
  final DateTime time;

  Message({
    required this.text,
    required this.sender,
    required this.time,
  });
}
