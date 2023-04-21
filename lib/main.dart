import 'dart:ffi';

import 'package:flutter/material.dart';

void main(){
  runApp(Home());
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),home: Bmi(),
    );
  }
}
class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController _weight = TextEditingController();
  TextEditingController _height = TextEditingController();
  var b ="";
  void calculate(){

    double wt = double.parse(_weight.text);
    double ht = double.parse(_height.text)/100;
    double result = wt/(ht*ht);


    setState(() {
      b="bmi is :${result.toStringAsFixed(2)}";


    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: [
              Text("Weight",textAlign:TextAlign.left,style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey
              ),),
              SizedBox(height: 20),
              TextField(
                controller: _weight,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Weight",
                    hintText: "enter weight in kg",
                    hintStyle: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.line_weight_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blueGrey),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text("Height",textAlign:TextAlign.left,style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey
              ),),
              SizedBox(height: 20),
              TextField(
                controller: _height,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Height",
                    hintText: "Enter height in cm ",
                    prefixIcon: Icon(Icons.height_rounded),
                    hintStyle: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    //hint text style
                    labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blueGrey),
                    ) //label style
                ),),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 75,
                child: ElevatedButton(onPressed: (){
                  if(_weight.text==""&& _height.text==""){
                    setState(() {
                      b="please enter all details";

                    });
                  }
                  else{

                    calculate();
                  }},


                    child: Text("CALCULATE",style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.blueGrey
                              )
                          )
                      ),)


                ),
              ),
              SizedBox(height: 20,),

              Text(b,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              //Text(_result==16? "underweight": "bmi :$_result")
            ],


          ),
        ),
      ),
    );
  }


}







