import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF390050),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/syazana kiyut.jpeg',
                    height: 200,
                  ),
                ),
              ),
            ),
            Card(
              color: Color(0xFF9F6ECC),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Name : Nur Syazana Insyirah Binti Mahat',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('ID Number : DFI2301018',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Email : syaz230604@gmail.com',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Class : 4A',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Address : Brickfield,Kuala Lumpur',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Phone Number : 0129782580',style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

