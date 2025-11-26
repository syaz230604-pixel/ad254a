import 'package:ad254a/info.dart';
import 'package:ad254a/myprofile.dart';
import 'package:ad254a/sign_up.dart';
import 'package:ad254a/sign_up1.dart';
import 'package:ad254a/webview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Color(0xFF390050), fontSize: 30),),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        leading: Icon(Icons.account_circle_outlined),
        actions: [
          Icon(Icons.add),
          IconButton(onPressed: (){}, icon : Icon(Icons.ad_units_outlined))
        ],
      ),
      body: Stack(
        children : [
          Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.purpleAccent,
                  Color(0xFFAB16EC)
                ]
            )
          ),
        ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                    'https://png.pngtree.com/png-clipart/20230512/original/pngtree-isolated-cat-on-white-background-png-image_9158356.png',
                height: 300,
                ),
              ),
              SizedBox(height: 50,),
              Text('Please select menu', style: TextStyle(color: Color(0xFF390050), fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                            },
                            child: Text('Profile',style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9F6ECC)
                        ),
                        )
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoPage()));
                            },
                            child: Text('Info',style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9F6ECC)
                        ),
                        )
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp1Page()));
                          },
                          child: Text('SignUp',style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9F6ECC)
                        ),
                        )
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewPage()));
                          },
                          child: Text('Web View',style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9F6ECC)
                        ),
                        )
                    ),
                  ],
                ),
              ),
              // Image.asset('assets/cat.gif'),
              // Image.asset('assets/cat.gif'),
            ],
          ),
        ],
      ),
    );
  }
}
