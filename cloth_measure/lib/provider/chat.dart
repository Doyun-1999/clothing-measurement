import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅방 목록'),
      ),
      body: ListView(
        children: [
          ChatListItem(
            title: '아미 S사이즈 반팔 팝니다',
            onTap: () {
              navigateToChatScreen(context, '아미 S사이즈 반팔 팝니다');
            },
          ),
          ChatListItem(
            title: '반팔 사이즈 확인 부탁드려요',
            onTap: () {
              navigateToChatScreen(context, '반팔 사이즈 확인 부탁드려요');
            },
          ),
          ChatListItem(
            title: '로카티 L사이즈 반팔 팝니다',
            onTap: () {
              navigateToChatScreen(context, '로카티 L사이즈 반팔 팝니다');
            },
          ),
          ChatListItem(
            title: '1번입은 이벳필드 반팔',
            onTap: () {
              navigateToChatScreen(context, '1번입은 이벳필드 반팔');
            },
          ),
          ChatListItem(
            title: '의류 판매중',
            onTap: () {
              navigateToChatScreen(context, '의류 판매중');
            },
          ),
        ],
      ),
    );
  }

  void navigateToChatScreen(BuildContext context, String chatTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(title: chatTitle),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ChatListItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 19),
      ),
      subtitle: Text(
        '마지막 메시지',
        style: TextStyle(fontSize: 15),
      ),
      onTap: onTap,
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String title;

  const ChatScreen({required this.title});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = []; // 채팅 메시지 목록
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // 새로운 메시지가 아래로 추가되도록 변경
              itemCount: messages.length,
              itemBuilder: (context, index) => ListTile(
                title: Align(
                  alignment: messages[index].startsWith('나: ')
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: messages[index].startsWith('나: ')
                          ? Colors.lightBlue
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: messages[index].startsWith('나: ')
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: '메시지를 입력하세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    sendMessage();
                  },
                  child: Text('전송'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String message = messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.insert(0, '나: $message'); // 새로운 메시지가 위로 추가되도록 변경
      });
      messageController.clear();
    }
  }
}
