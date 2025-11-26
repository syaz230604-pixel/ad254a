import 'package:ad254a/sign_in1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp1Page extends StatefulWidget {
  const SignUp1Page({super.key});

  @override
  State<SignUp1Page> createState() => _SignUp1PageState();
}

class _SignUp1PageState extends State<SignUp1Page> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn1Page(),
                ),
              );
            },
            icon: const Icon(Icons.input),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email'
              ),
            ),
            SizedBox( height: 10,),
            TextField(
          controller: passwordController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password'
            ),
           ),
            ElevatedButton(onPressed: () async {
              try{
                final userCredential = await auth.createUserWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text);

                final user = userCredential.user;

                if(user == null){
                  throw Exception('Registration Failed!');
                }

              }catch(e){print('Error: ${e}');}
            }, child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}