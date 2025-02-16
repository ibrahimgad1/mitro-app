import 'package:finalproject/pages/map_image_page.dart';
import 'package:finalproject/pages/sationsDetails.dart';
import 'package:finalproject/pages/ticket_log_page.dart';
import 'package:flutter/material.dart';

class MetroTicketReservation extends StatefulWidget {
  @override
  _MetroTicketReservationState createState() => _MetroTicketReservationState();
}

class _MetroTicketReservationState extends State<MetroTicketReservation> {
  String? selectedLine;
  String? departureStation;
  String? destinationStation;

  final List<String> metroLines = ['Line 1', 'Line 2', 'Line 3'];

  final Map<String, List<String>> metroStations = {
    'Line 1': [
      'Helwan', 'Ain Helwan', 'Helwan University', 'Wadi Hof', 'Hadayek Helwan',
      'El-Maasara', 'Tora El-Asmant', 'Kozzika', 'Tora El-Balad', 'Sakanat El-Maadi',
      'Maadi', 'Hadayek El-Maadi', 'Dar El-Salam', 'El-Zahraa\'', 'Mar Girgis',
      'El-Malek El-Saleh', 'Al-Sayeda Zeinab', 'Saad Zaghloul', 'Sadat', 'Nasser',
      'Orabi', 'Al-Shohadaa', 'Ghamra', 'El-Demerdash', 'Manshiet El-Sadr',
      'Kobri El-Qobba', 'Hammamat El-Qobba', 'Saray El-Qobba', 'Hadayeq El-Zaitoun',
      'Helmeyet El-Zaitoun', 'El-Matareyya', 'Ain Shams', 'Ezbet El-Nakhl', 'El-Marg',
      'New El-Marg'
    ],
    'Line 2': [
      'El-Mounib', 'Sakiat Mekki', 'Omm El-Misryeen', 'Giza', 'Faisal', 'Cairo University',
      'Bohooth', 'Dokki', 'Opera', 'Sadat', 'Mohamed Naguib', 'Ataba', 'Al-Shohadaa',
      'Massara', 'Rod El-Farag', 'St. Teresa', 'El-Khalafawy', 'El-Mezallat',
      'Kolleyyet El-Zeraa', 'Shubra El-Kheima'
    ],
    'Line 3': [
      'Al-Ahram', 'Koleyet El-Banat', 'Cairo Stadium', 'Cairo Fair', 'Abbassiya',
      'Abdou Pasha', 'El-Geish', 'Bab El-Shaaria', 'Ataba'
    ],
  };

  int calculateNumStations(String? line, String? departure, String? destination) {
    if (line == null || departure == null || destination == null) {
      return 0;
    }
    List<String> stations = metroStations[line]!;
    int departureIndex = stations.indexOf(departure);
    int destinationIndex = stations.indexOf(destination);
    return (departureIndex - destinationIndex).abs();
  }

  int calculateTicketPrice(int numStations) {
    if (numStations < 9) {
      return 8;
    } else if (numStations >= 9 && numStations <= 16) {
      return 10;
    } else {
      return 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mbc.jpeg"), // Add your background image here
            fit: BoxFit.fitHeight, // Make the image cover the entire screen
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.black54,
              title: const Text(
                'Metro App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.jpeg"), // Correct way to set image for circular shape
                radius: 25, // Adjust the size as needed
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(Icons.map, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapImagePage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(Icons.list, color: Colors.white), // Add a list icon
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TicketLogPage()), // Navigate to TicketLogPage
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.1), // Add transparency to see background
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book Your Metro Ticket',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Metro ticket booking is available for everyone.',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        // Metro line dropdown
                        DropdownButtonFormField<String>(
                          value: selectedLine,
                          decoration: InputDecoration(
                            labelText: 'Select Metro Line',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          items: metroLines.map((line) {
                            return DropdownMenuItem<String>(
                              value: line,
                              child: Text(line),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLine = value;
                              departureStation = null; // Reset stations
                              destinationStation = null;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        // Departure station dropdown
                        DropdownButtonFormField<String>(
                          value: departureStation,
                          decoration: InputDecoration(
                            labelText: 'Departure Station',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          items: selectedLine == null
                              ? []
                              : metroStations[selectedLine]!.map((station) {
                            return DropdownMenuItem<String>(
                              value: station,
                              child: Text(station),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              departureStation = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        // Destination station dropdown
                        DropdownButtonFormField<String>(
                          value: destinationStation,
                          decoration: InputDecoration(
                            labelText: 'Destination Station',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          items: selectedLine == null
                              ? []
                              : metroStations[selectedLine]!.map((station) {
                            return DropdownMenuItem<String>(
                              value: station,
                              child: Text(station),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              destinationStation = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              int numStations = calculateNumStations(
                                  selectedLine, departureStation, destinationStation);
                              int ticketPrice = calculateTicketPrice(numStations);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketDetailsPage(
                                    line: '$selectedLine',
                                    departure: '$departureStation',
                                    destination: '$destinationStation',
                                    numStations: numStations,
                                    price: ticketPrice,
                                  ),
                                ),
                              );
                            },
                            child: Text('Find Tickets'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              textStyle: TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded button
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
