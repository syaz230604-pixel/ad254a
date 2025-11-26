import 'package:ad254a/pizza_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home2Page extends StatelessWidget {
  const Home2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text('Home', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.account_circle)
          ],
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/pizza.gif',height: 300,)
              ],
            ),
            SizedBox(height: 15,),
            Text('LePizza', style: TextStyle(color: Colors.redAccent, fontSize: 30,fontWeight: FontWeight.bold,),),
            Text(
              '🔥Hot, Fresh and Delicious - Your Perfect Slice Awaits !🍕',
              style: GoogleFonts.yatraOne(),

            ),
            SizedBox(height: 40,),
            ElevatedButton.icon(
              icon: Icon(Icons.local_pizza_outlined, color: Colors.white,),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PizzaMenuPage()));
                },
                label: Text('Order Now', style: TextStyle(color: Colors.white,fontSize: 25, fontStyle: FontStyle.italic ),),
                style:ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            )
          ],
        ),
      ),
    );
  }
}
