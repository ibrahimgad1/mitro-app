import 'package:finalproject/pages/paymentDetails.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'Credit Card',
      'icon': Icons.credit_card,
    },
    {
      'name': 'Vodafone Cash',
      'icon': Icons.money,
    },
    {
      'name': 'Fawry',
      'icon': Icons.payment,
    },
  ];

  // Add parameters for ticket details
  final String line;
  final String departure;
  final String destination;
  final int numStations;
  final int price;

  PaymentMethodsScreen({
    required this.line,
    required this.departure,
    required this.destination,
    required this.numStations,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Select Payment Method',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Icon(
                  paymentMethods[index]['icon'],
                  color: Colors.blueAccent,
                ),
              ),
              title: Text(
                paymentMethods[index]['name'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.blueAccent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentDetailsScreen(
                      paymentMethod: paymentMethods[index]['name'],
                      // Pass ticket details to PaymentDetailsScreen
                      line: line,
                      departure: departure,
                      destination: destination,
                      numStations: numStations,
                      price: price,
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
      ),
    );
  }
}
