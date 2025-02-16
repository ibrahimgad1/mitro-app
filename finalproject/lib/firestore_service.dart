import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Method to get all ticket logs
  Future<List<Map<String, dynamic>>> getTicketLogs() async {
    final snapshot = await _db.collection('tickets').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
