import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/finalTicket.dart';
import 'package:flutter/material.dart';

// Function to save ticket details in Firestore
void saveTicketInfo(String userId, Map<String, dynamic> ticketDetails) {
  FirebaseFirestore.instance.collection('tickets').add({
    'userId': userId,
    ...ticketDetails,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

class PaymentDetailsScreen extends StatelessWidget {
  final String paymentMethod;

  // Add parameters for ticket details
  final String line;
  final String departure;
  final String destination;
  final int numStations;
  final int price;

  PaymentDetailsScreen({
    required this.paymentMethod,
    required this.line,
    required this.departure,
    required this.destination,
    required this.numStations,
    required this.price,
  });

  // Assuming you have the user's ID stored somewhere
  final String userId = 'yourUserId'; // Replace with actual user ID from auth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Payment Details', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text(
                'Payment Method: $paymentMethod',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
              SizedBox(height: 20),

              // Payment method specific details
              _buildPaymentDetails(context),

              SizedBox(height: 30),
              // Confirm Payment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Define the ticket details to be saved
                    final ticketDetails = {
                      'line': line,
                      'departure': departure,
                      'destination': destination,
                      'numStations': numStations,
                      'price': price,
                      'paymentMethod': paymentMethod,
                    };

                    // Save the ticket info to Firestore
                    saveTicketInfo(userId, ticketDetails);

                    // Navigate to Ticket Details screen after confirming payment
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDetailsScreen(
                          paymentMethod: paymentMethod,
                        ),
                      ),
                    );
                  },
                  child: Text('Confirm Payment'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.white54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentDetails(BuildContext context) {
    // Add specific details based on the payment method if needed
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ticket Details:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Line: $line'),
        Text('From: $departure'),
        Text('To: $destination'),
        Text('Stations: $numStations'),
        Text('Price: ${price.toStringAsFixed(2)} EGP'),
      ],
    );
  }
}
