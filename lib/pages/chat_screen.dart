import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:univolve_app/pages/chatroom_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 250, 250, 250),
              Color.fromARGB(255, 237, 240, 241),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            stops: [0.0, 0.3, 0.7, 1.0], // Adjust stops for smoother gradient
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                    ), // Add left padding of 16.0 (adjust as needed)
                    child: Text(
                      'Chats',
                      style: GoogleFonts.poppins(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ), // Add left padding of 16.0 (adjust as needed)
                child: Text(
                  'Friend Recommendations',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Replace these widgets with your actual friend list
                    _buildFriendWidget('Barry', 'lib/assets/images/image1.png'),
                    _buildFriendWidget('Perez', 'lib/assets/images/image22.png'),
                    _buildFriendWidget('Alvin', 'lib/assets/images/image33.png'),
                    _buildFriendWidget('Dan', 'lib/assets/images/image44.png'),
                    _buildFriendWidget('Fresh', 'lib/assets/images/chat222.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: ListView(
                    children: [
                      // Replace this GestureDetector with your actual chat UI
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatRoomScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 35, right: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: Image.asset('lib/assets/images/jimil1.png').image,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jimil Hingu       ',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        '08:43',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Hey! Where are my pictures?!',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFriendWidget(String name, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: Image.asset(imagePath).image,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 17.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

