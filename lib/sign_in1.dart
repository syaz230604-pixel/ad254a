import 'package:ad254a/myprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn1Page extends StatefulWidget {
  const SignIn1Page({super.key});

  @override
  State<SignIn1Page> createState() => _SignIn1PageState();
}

class _SignIn1PageState extends State<SignIn1Page> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Insert your infomation to sign in'),
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
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password'
              ),
            ),
            ElevatedButton(onPressed: () async {

              try{
                final userCredential = await auth.signInWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text);

                final user = userCredential.user;

                if(user == null){
                  throw Exception('User login unsuccessfull');
                }

                // contoh alert dialog

                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('SUCCESSFUL'),
                        content: Text('You are now logged in'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfilePage()));
                          }, child: Text('OK'))
                        ],
                      );
                    }
                );

                // navigator.push -> nak pindahkan pada page yang lain

                // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfilePage()));

                // contoh alert dari firebase

              } on FirebaseAuthException catch(e){

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.message ?? 'Login failed'),
                  backgroundColor: Colors.redAccent,
                  showCloseIcon: true,
                ));

              } catch(e){
                print('Error: ${e}');

                //contoh snackbar

              const snackBar = SnackBar(
                content: Text('Login UnSuccessful!'),
                backgroundColor: Colors.redAccent,
                showCloseIcon: true,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

            },
                child: Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
