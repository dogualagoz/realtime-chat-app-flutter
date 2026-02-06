import 'package:flutter/material.dart';
import 'package:realtime_chat_app/pages/chat_page.dart';
import 'package:realtime_chat_app/services/auth/auth_service.dart';
import 'package:realtime_chat_app/services/chat/chat_service.dart';
import 'package:realtime_chat_app/widgets/my_drawer.dart';
import 'package:realtime_chat_app/widgets/user_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build a list of user list except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        //loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    // display all users except current user
    if (userData["email"] != _authService.getCurrentUser()?.email) {
      return UserTile(
        text: userData["email"] ?? "",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChatPage(receiverEmail: userData["email"], receiverID: userData["uid"]),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
