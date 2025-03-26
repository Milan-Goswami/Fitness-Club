
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Bmi_page extends StatefulWidget {
  const Bmi_page({super.key});

  @override
  State<Bmi_page> createState() => _Bmi_pageState();
}

class _Bmi_pageState extends State<Bmi_page> {

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = "";
  String _message = "";
  String _heightUnit = "cm";
  String _weightUnit = "kg";
  List<Map<String, String>> _bmiHistory = [];

  void _calculateBMI() {
  final double? height = double.tryParse(_heightController.text);
  final double? weight = double.tryParse(_weightController.text);

  if (height != null && weight != null && height > 0) {
  double heightInMeters;
  if (_heightUnit == "feet") {
  heightInMeters = height * 0.3048;
  } else {
  heightInMeters = height / 100;
  }

  double weightInKg;
  if (_weightUnit == "pound") {
  weightInKg = weight * 0.453592;
  } else {
  weightInKg = weight;
  }

  final double bmi = weightInKg / (heightInMeters * heightInMeters);
  final String dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  setState(() {
  _bmiResult = bmi.toStringAsFixed(1);
  if (bmi < 18.5) {
  _message = "Underweight";
  } else if (bmi >= 18.5 && bmi < 24.9) {
  _message = "Normal weight";
  } else if (bmi >= 25 && bmi < 29.9) {
  _message = "Overweight";
  } else {
  _message = "Obesity";
  }

  _bmiHistory.insert(0, {
  "dateTime": dateTime,
  "height": "${_heightController.text} $_heightUnit",
  "weight": "${_weightController.text} $_weightUnit",
  "bmi": _bmiResult,
  "message": _message
  });
  });
  } else {
  setState(() {
  _bmiResult = "";
  _message = "Please enter valid values!";
  });
  }
  }

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Stream<DocumentSnapshot<Map<String, dynamic>>>getUserDetails(){
    return FirebaseFirestore.instance
        .collection("Data")
        .doc(currentUser!.email)
        .snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.grey[300],
      body:StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: getUserDetails(),
              builder: (context,snapshot) {

                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }
                else if(snapshot.hasData){
                  Map<String,dynamic>? user = snapshot.data!.data();
                  return  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset('assets/image/bmi.png',height: 100,),

                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(' Height : '),
                            Text(user!['height']),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(' Weight : '),
                            ),
                            Text(user!['weight'].toString()),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [

                              Expanded(
                                child: TextField(
                                  controller: _heightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Height',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10),

                              DropdownButton<String>(
                                value: _heightUnit,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _heightUnit = newValue!;
                                  });
                                },
                                items: <String>["cm", "feet"]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _weightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Weight',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),

                              DropdownButton<String>(
                                value: _weightUnit,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _weightUnit = newValue!;
                                  });
                                },
                                items: <String>["kg", "pound"]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: GestureDetector(
                            onTap:  () async {

                              _calculateBMI();
                              await FirebaseFirestore.instance.collection('BMI')
                                  .doc(currentUser!.email)
                                  .set({
                                'bmi': _bmiResult.toString(),
                                'message':_message.toString(),
                                'dateTime': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString(),
                              });

                            },
                            child: Container(
                              height: 70,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child:Center(
                                  child: Text(
                                    'Calculate BMI',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,color: Colors.white
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        if (_bmiResult.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Your BMI: $_bmiResult',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                _message,
                                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                              ),
                            ],
                          ),

                        SizedBox(height: 16.0),

                        Text(
                          'BMI History:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListView.builder(
                              itemCount: _bmiHistory.length,
                              itemBuilder: (context, index)  {
                                final entry = _bmiHistory[index];
                                return  Card(
                                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                                  child: ListTile(
                                    title: Text(
                                      "BMI: ${entry['bmi']} (${entry['message']})",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "Height: ${entry['height']}, Weight: ${entry['weight']}\nDate: ${entry['dateTime']}",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                        ),

                      ],
                    ),
                  );
                }
                else
                {
                  return Text("No Data");
                }
              },
            ),
    );
  }
}

