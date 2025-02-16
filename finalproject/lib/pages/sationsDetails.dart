import 'package:finalproject/pages/payment.dart';
import 'package:flutter/material.dart';

class TicketDetailsPage extends StatelessWidget {
  final String line;
  final String departure;
  final String destination;
  final int numStations;
  final int price; // Change to double if you want to support decimal prices

  TicketDetailsPage({
    required this.line,
    required this.departure,
    required this.destination,
    required this.numStations,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Ticket', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.white54,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ticket Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Metro Ticket', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Icon(Icons.directions_subway, size: 40, color: Colors.blueAccent),
                ],
              ),
              Divider(color: Colors.grey, thickness: 2),
              SizedBox(height: 10),
              // Ticket Details
              Text('Line: $line', style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text('From: $departure', style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text('To: $destination', style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text('Stations: $numStations', style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text('Price: ${price.toStringAsFixed(2)} EGP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Image.asset(
                "assets/images/logo.jpeg",
                fit: BoxFit.cover, // Cover to maintain aspect ratio
              ),
              // Purchase Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to PaymentMethodsScreen while passing ticket details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodsScreen(
                          line: line,
                          departure: departure,
                          destination: destination,
                          numStations: numStations,
                          price: price,
                        ),
                      ),
                    );
                  },
                  child: Text('Purchase Ticket'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
