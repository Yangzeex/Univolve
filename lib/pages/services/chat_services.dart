import 'package:cloud_firestore/cloud_firestore.dart';


class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


    Future<Map<String, dynamic>?> getUserByUniversityId(String universityId) async {
    final userSnapshot = await _firestore.collection('users').where('universityId', isEqualTo: universityId).get();
    if (userSnapshot.docs.isNotEmpty) {
      final userData = userSnapshot.docs.first.data();
      return userData;
    } else {
      return null;
    }

    
  
  }



}