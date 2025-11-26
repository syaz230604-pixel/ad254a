import 'package:ad254a/actuator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://iot-app-f57db-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();

  String tempValue = '0';
  String humValue = '0';
  String ultrasonicValue = '0';

  @override
  void initState() {
    super.initState();
    _readSensor();
  }

  void _readSensor() {
    // Temperature
    _dbRef.child('Sensor/Temperature').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          tempValue = data.toString();
        });
      }
    });

    // Humidity
    _dbRef.child('Sensor/Humidity').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          humValue = data.toString();
        });
      }
    });

    // Ultrasonic Sensor
    _dbRef.child('Sensor/Ultrasonic').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          ultrasonicValue = data.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sensor Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF390050),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.purple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              icon: Icons.thermostat,
              title: "Temperature",
              value: "$tempValue °C",
              color: Colors.orange,
            ),
            const SizedBox(height: 20),
            _buildCard(
              icon: Icons.water_drop,
              title: "Humidity",
              value: "$humValue %",
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            _buildCard(
              icon: Icons.sensors,
              title: "Ultrasonic Sensor",
              value: "$ultrasonicValue cm",
              color: Colors.redAccent,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActuatorPage(),
                    ),
                  );
                },
                label: const Text(
                  'Go to Actuator',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: const Color(0xFF390050),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(icon, size: 30, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black87)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
