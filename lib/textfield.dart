import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  
  var nameController = TextEditingController();
  var classController = TextEditingController();
  var studentnumberController = TextEditingController();

  String _name = '';
  String _class = '';
  String _studentnumber = '';
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Text Field Exercise'),
        centerTitle: true,
        

      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Please insert your details'),
            SizedBox(height: 20,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter Your Name',
                  prefixIcon: Icon(Icons.account_circle_outlined),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: classController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Class',
                hintText: 'Enter Your Class',
                prefixIcon: Icon(Icons.book_outlined),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: studentnumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Student Number',
                hintText: 'Enter Your Student Number',
                  prefixIcon: Icon(Icons.contact_page_outlined),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              setState(() {
               _name = nameController.text;
               _class = classController.text;
               _studentnumber = studentnumberController.text;
              });
            }, child: Text('Submit')),
            SizedBox(height: 50,),
            Text('My name is ${_name}'),
            Text('My class is ${_class}'),
            Text('My student number is ${_studentnumber}')
          ],
        ),
      ),
    );
  }
}
