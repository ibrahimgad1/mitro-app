import 'package:flutter/material.dart';

class MapImagePage extends StatelessWidget {
  const MapImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Lighter grey for a softer background
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Metro Map',
          style: TextStyle(
            color: Colors.white, // Changed to white for better contrast
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for better spacing
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: [
              Text(
                "Cairo Metro Map",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent, // Consistent color with the app bar
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                  child: Image.asset(
                    "assets/images/MapCairoMetro.jpg",
                    fit: BoxFit.cover, // Cover to maintain aspect ratio
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your navigation logic here
                },
                child: Text("View Details"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded button
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