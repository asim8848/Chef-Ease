import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../../constants/colors.dart';

class UserChat extends StatefulWidget {
  final String chatRoomId;
  final Map<String, dynamic> companionData;
  final String companionName;
  final String companionImageUrl;

  const UserChat({
    Key? key,
    required this.chatRoomId,
    required this.companionData,
    required this.companionName,
    required this.companionImageUrl,
  }) : super(key: key);

  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  final TextEditingController _textController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _markMessagesAsRead();
  }

  void _markMessagesAsRead() {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    _firestore.collection('chats').doc(widget.chatRoomId).update({
      'unreadMessages.$currentUserId': 0,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.secondaryColor),  // Custom icon and color
          onPressed: () => Navigator.of(context).pop(),
        ),
        // Assuming you have defined this color in your constants
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.companionImageUrl),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.companionName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.secondaryColor)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert,color: AppColors.secondaryColor,),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .doc(widget.chatRoomId)
                  .collection('messages')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                var messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index].data() as Map<String, dynamic>;
                    bool isSentByMe =
                        message['sender'] == FirebaseAuth.instance.currentUser?.uid;

                    DateTime messageTime =
                        (message['time'] as Timestamp?)?.toDate() ?? DateTime.now();
                    bool isNewMessage = messageTime.difference(DateTime.now()).inDays == 0;

                    return ListTile(
                      title: Align(
                        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSentByMe ? AppColors.primaryColor : Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(message['text'], style: TextStyle(color: isSentByMe ? Colors.white : Colors.black)),
                        ),
                      ),
                      subtitle: Align(
                        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Text(DateFormat('hh:mm a').format(messageTime), style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child:  _buildTextComposer(),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTextComposer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Send a message...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (_textController.text.isNotEmpty) {
      var message = {
        'text': _textController.text,
        'sender': FirebaseAuth.instance.currentUser!.uid,
        'time': FieldValue.serverTimestamp(),
      };

      // Add the message to the 'messages' collection
      _firestore.collection('chats').doc(widget.chatRoomId).collection('messages').add(message);

      // Update the last message text in the chat room document
      _firestore.collection('chats').doc(widget.chatRoomId).update({
        'lastMessage': _textController.text,
        'lastMessageTime': FieldValue.serverTimestamp(),
        'unreadMessages.${widget.companionData['uid']}': FieldValue.increment(1),
      });

      _textController.clear();
    }
  }
}
