import 'package:flutter/material.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({super.key});

  @override
  State<Home1Page> createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {

  
  double height = 1.0;
  TextEditingController weightController = TextEditingController();


  AlertDialog PopUp(double height, double weight){

    double bmi = weight/(height*height);
    String category = '';

    if(bmi < 18.5){
      category = 'Underweight';
    }
    else if (bmi >= 18.5 && bmi < 25){
      category = 'Normal';
    }
    else if (bmi >= 25 && bmi < 30){
      category = 'Overweight';
    }
    else if (bmi >= 30 && bmi < 35){
      category = 'Obese';
    }
    else if (bmi >= 35){
      category = 'Extremely Obese';
    }

    return AlertDialog(
      title: Text('Your BMI'),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${bmi.toStringAsFixed(2)}"),
            Text(category),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image.network(
                    'https://cdn-icons-png.freepik.com/512/10481/10481308.png',
                    height: 200,
                ),
              ),
              SizedBox(height: 40,),
              Text('Height (m)'),
              Text('${height.toStringAsFixed(2)} m'),
              Slider(
                min: 0.00,
                  max: 2.00,
                  value: height,
                  onChanged: (heightValue){
                setState(() {
                  height = heightValue;
                });
              }),

              SizedBox(height: 40,),

              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  hintText: 'Insert your weight truthfully',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){

                double weight = double.parse(weightController.text);

                showDialog(context: context, builder: (BuildContext context){
                  return PopUp(height, weight);
                },);
              }, child: Text(
                'Calculate',
                style: TextStyle(color: Colors.white),
              ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
