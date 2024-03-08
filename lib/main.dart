import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:univolve_app/pages/AllAuthPages/auth_page.dart';
import 'package:univolve_app/pages/services/chat_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final chatService = ChatService();
  chatService.getUserByUniversityId("T00704197").then((user) {
    if (user != null) {
      print(user);
      print("TESTINGINIGNIGNNIG");
      if (user.containsKey('friends') && user['friends'] != null) {
        final List<String> friends = List<String>.from(user['friends']);
        print(friends);
        for (String friendId in friends) {
          chatService.getUserByUniversityId(friendId).then((friendData) {
            if (friendData != null) {
              print('Friend ID: $friendId, Friend Data: $friendData');
              // Here you can process the friend's data as needed
            } else {
              print('Friend with ID $friendId not found');
            }
          });
        }
      } else {
        print('User has no friends');
      }
    } else {
      print('User not found');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Univolve',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}
