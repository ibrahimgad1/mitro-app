import 'package:finalproject/firestore_service.dart';
import 'package:flutter/material.dart';

class TicketLogPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Logs',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal, // Changed to a vibrant color
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _firestoreService.getTicketLogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No ticket logs available.'));
          }

          final ticketLogs = snapshot.data!;

          return ListView.separated(
            itemCount: ticketLogs.length,
            itemBuilder: (context, index) {
              final ticket = ticketLogs[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Line: ${ticket['line']}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Departure: ${ticket['departure']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Destination: ${ticket['destination']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Price: \$${ticket['price']}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 8), // Space between cards
          );
        },
      ),
    );
  }
}
