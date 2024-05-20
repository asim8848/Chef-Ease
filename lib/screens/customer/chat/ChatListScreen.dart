import 'package:chefease/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../api/chef_api.dart';
import '../../../api/customer_api.dart';
import 'ChatUserScreen.dart';
import 'package:intl/intl.dart'; // Needed for date formatting

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userRole = await _checkUserRole();
    if (userRole == 'Chef') {
      var customers = await CustomerApi().getAllCustomers();
      _updateUserList(customers, 'Customer');
    } else if (userRole == 'Customer') {
      var chefs = await ChefApi().getAllChefs();
      _updateUserList(chefs, 'Chef');
    } else {
      setState(() => _isLoading = false);
    }
  }

  void _updateUserList(List<Map<String, dynamic>> users, String role) {
    setState(() {
      _users = users.map((user) {
        return {
          'uid': user['${role}FirebaseID'] ?? 'unknown',
          'Name': user['Name'] ?? 'Unknown',
          'ProfileImageURL': user['ProfileImageURL'] ?? 'path/to/default/image.jpg',
          'role': role
        };
      }).toList();
      _isLoading = false;
    });
  }
  Future<String> _checkUserRole() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      try {
        final customerData = await CustomerApi().getCustomer(user.uid);
        if (customerData['Role'] == 'Customer') {
          return 'Customer';
        }
      } catch (e) {
        print('No customer data found for this user: $e');
      }

      try {
        final chefData = await ChefApi().getChef(user.uid);
        if (chefData['Role'] == 'Chef') {
          return 'Chef';
        }
      } catch (e) {
        print('No chef data found for this user: $e');
      }
    }
    return ''; // Return empty string if user role is not found
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: SpinKitFoldingCube(color:AppColors.primaryColor))
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return _buildChatTile(user);
        },
      ),
    );
  }

  Widget _buildChatTile(Map<String, dynamic> user) {
    String imageUrl = user['ProfileImageURL'];
    String chatRoomId = _generateChatRoomId(_auth.currentUser!.uid, user['uid']);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () => _navigateToChatScreen(user),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 28,
          backgroundColor: Colors.grey[200],
          onBackgroundImageError: (exception, stackTrace) => Icon(Icons.account_circle, size: 28),
        ),
        title: Text(
          user['Name'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: StreamBuilder<DocumentSnapshot>(
          stream: _firestore.collection('chats').doc(chatRoomId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('Loading...');
            var data = snapshot.data!.data() as Map<String, dynamic>?;
            String lastMessage = data?['lastMessage'] ?? 'Tap to chat';
            return Text(
              lastMessage,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
        trailing: _buildMessageCount(user),
      ),
    );
  }

  Widget _buildMessageCount(Map<String, dynamic> user) {
    String chatRoomId = _generateChatRoomId(_auth.currentUser!.uid, user['uid']);
    return StreamBuilder<DocumentSnapshot>(
      stream: _firestore.collection('chats').doc(chatRoomId).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return SizedBox();
        var data = snapshot.data!.data() as Map<String, dynamic>?;
        int unreadMessages = data?['unreadMessages']?[_auth.currentUser!.uid] ?? 0;
        var lastMessageTime = data?['lastMessageTime']?.toDate() ?? DateTime.now();
        String formattedTime = DateFormat('hh:mm a').format(lastMessageTime);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              formattedTime,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 8),
            if (unreadMessages > 0)
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor, // You can change color as per your design
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$unreadMessages',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }


  String _generateChatRoomId(String userId1, String userId2) {
    List<String> ids = [userId1, userId2];
    ids.sort();
    return ids.join('_');
  }

  void _navigateToChatScreen(Map<String, dynamic> userData) {
    final String chatRoomId = _generateChatRoomId(_auth.currentUser!.uid, userData['uid']);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserChat(
          chatRoomId: chatRoomId,
          companionData: userData,
          companionName: userData['Name'],
          companionImageUrl: userData['ProfileImageURL'],
        ),
      ),
    );
  }
}
