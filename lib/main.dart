import 'package:ad254a/actuator.dart';
import 'package:ad254a/firebase_options.dart';
import 'package:ad254a/home.dart';
import 'package:ad254a/home1.dart';
import 'package:ad254a/home2.dart';
import 'package:ad254a/home3.dart';
import 'package:ad254a/myprofile.dart';
import 'package:ad254a/sensor.dart';
import 'package:ad254a/sign_in.dart';
import 'package:ad254a/textfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    print('⚠️ Firebase already initialized: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SignInPage(),
    );
  }
}


