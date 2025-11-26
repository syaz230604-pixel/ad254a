import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home3Page extends StatefulWidget {
  const Home3Page({super.key});

  @override
  State<Home3Page> createState() => _Home3PageState();
}

class _Home3PageState extends State<Home3Page> {
  int selectedIndex = 0;
  bool waterPump = false;
  bool phPump = false;
  bool lamp = false;
  bool manualMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            buildDashboard(),
            const Center(child: Text('Search Page')),
            const Center(child: Text('Menu Page')),
            const Center(child: Text('Profile Page')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello, Syasya! 💖',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.settings_outlined, color: Colors.black, size: 28),
                  SizedBox(width: 12),
                  Icon(Icons.notifications_none_outlined, color: Colors.black, size: 28),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildSensorCard('Soil Moisture', '80%', 'assets/soilmoisture2.png'),
                const SizedBox(width: 12),
                buildSensorCard('Light Sensor', '60%', 'assets/lightsensor.png'),
                const SizedBox(width: 12),
                buildSensorCard('pH Sensor', '6.8', 'assets/phsensor.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mode: ${manualMode ? "Manual" : "Auto"}',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Switch(
                value: manualMode,
                onChanged: (val) {
                  setState(() => manualMode = val);
                },
                activeColor: Colors.white,
                activeTrackColor: Colors.pinkAccent,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Device Control',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          buildDeviceSwitch('💧 Water Pump', waterPump, (val) {
            setState(() => waterPump = val);
          }),
          buildDeviceSwitch('🧪 pH Pump', phPump, (val) {
            setState(() => phPump = val);
          }),
          buildDeviceSwitch('💡 Lamp', lamp, (val) {
            setState(() => lamp = val);
          }),
        ],
      ),
    );
  }

  Widget buildSensorCard(String title, String value, String imagePath) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDeviceSwitch(String label, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
