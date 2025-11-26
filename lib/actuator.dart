import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actuator Dashboard',
      home: const ActuatorPage(),
    );
  }
}

class ActuatorPage extends StatefulWidget {
  const ActuatorPage({super.key});

  @override
  State<ActuatorPage> createState() => _ActuatorPageState();
}

class _ActuatorPageState extends State<ActuatorPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://iot-app-f57db-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();

  bool switchButton1 = false;
  bool switchBuzzer = false;

  @override
  void initState() {
    super.initState();
    _loadSwitchStatus();
  }

  void _loadSwitchStatus() {
    _dbRef.child('Actuator/button1').onValue.listen((event) {
      setState(() {
        switchButton1 = event.snapshot.value as bool? ?? false;
      });
    });

    _dbRef.child('Actuator/buzzer').onValue.listen((event) {
      setState(() {
        switchBuzzer = event.snapshot.value as bool? ?? false;
      });
    });
  }

  void _updateButton1(bool value) {
    _dbRef.child('Actuator/button1').set(value);
    setState(() {
      switchButton1 = value;
    });
  }

  void _updateBuzzer(bool value) {
    _dbRef.child('Actuator/buzzer').set(value);
    setState(() {
      switchBuzzer = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actuator Control', style: TextStyle(fontSize: 18, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF390050),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.purple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildActuatorCard(
                  title: 'Button 1',
                  status: switchButton1,
                  onChanged: _updateButton1,
                ),
                const SizedBox(height: 20),
                _buildActuatorCard(
                  title: 'Buzzer',
                  status: switchBuzzer,
                  onChanged: _updateBuzzer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActuatorCard({
    required String title,
    required bool status,
    required Function(bool) onChanged,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(status ? "ON" : "OFF",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: status ? Colors.green : Colors.red,
            )),
        trailing: Switch(
          value: status,
          onChanged: onChanged,
          activeColor: Colors.purple.shade400,
        ),
      ),
    );
  }
}
