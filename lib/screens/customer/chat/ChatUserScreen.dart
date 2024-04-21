import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:chefease/constants/colors.dart';

class UserChat extends StatefulWidget {
  const UserChat({Key? key}) : super(key: key);

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  final TextEditingController _textController = TextEditingController();

  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    // Initialize some old messages
    _messages.addAll([
      ChatMessage(
          text: 'Hi, Anna! How’s your business ?',
          isSentByMe: false,
          time: DateTime.now()),
      ChatMessage(
        text: 'Its Awesome..',
        isSentByMe: true,
        time: DateTime.now(),
      ),
      ChatMessage(
          text: 'I am looking for someone to make italian pizza',
          isSentByMe: false,
          time: DateTime.now()),
      ChatMessage(
        text: 'Sure  i can make ',
        isSentByMe: true,
        time: DateTime.now(),
      ),
      ChatMessage(
          text: 'How much do you charge?',
          isSentByMe: false,
          time: DateTime.now()),
      ChatMessage(
          text: 'I am looking for someone to make italian pizza',
          isSentByMe: false,
          time: DateTime.now()),
      ChatMessage(
        text: 'Sure  i can make ',
        isSentByMe: true,
        time: DateTime.now(),
      ),
      ChatMessage(
          text: 'How much do you charge?',
          isSentByMe: false,
          time: DateTime.now()),
      ChatMessage(
          text: 'Its upto 500PKR?',
          isSentByMe: false,
          time: DateTime.now()),
    ]);
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSentByMe: true, // Messages sent by the current user
      time: DateTime.now(),
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(
                  'assets/imgs/person1circle.png'), // Add your image here
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe', // Add your name here
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Online', // Add your status here
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_messages.isNotEmpty) _buildDateHeader(_messages.first.time),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                ),
              ),
            ),
            SizedBox(width: 8),
             Material(
                borderRadius: BorderRadius.circular(30.0),
                color: AppColors.primaryColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30.0),
                  onTap: () => _handleSubmitted(_textController.text),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }


  Widget _buildDateHeader(DateTime date) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          _formatDate(date),
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    return '$day/$month/$year';
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final DateTime time;

  const ChatMessage({
    Key? key,
    required this.text,
    required this.isSentByMe,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _formatTime(DateTime dateTime) {
      String hour = DateFormat('h').format(dateTime);
      String minute = DateFormat('mm').format(dateTime);
      String amPm = DateFormat('a').format(dateTime).toUpperCase();
      return '$hour:$minute $amPm';
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment:
        isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isSentByMe ? AppColors.primaryColor : Color(0xFFF8F8F8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isSentByMe ? 0 : 10.0),
                topRight: Radius.circular(isSentByMe ? 10.0 : 0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: isSentByMe ? Colors.white : Colors.black,
                  fontSize: 16.0),
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            alignment:
            isSentByMe ? Alignment.bottomRight : Alignment.bottomLeft,
            child: Text(
              _formatTime(time),
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
