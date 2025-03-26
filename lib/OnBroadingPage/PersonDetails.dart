import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitness_club/Page/HomePage.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  final User? currentUser = FirebaseAuth.instance.currentUser;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    "Personal Details",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'A personal workout plan is a written schedule of exercises that helps a person achieve their fitness goals. '
                      'It includes the types of exercises to do and how long to do them.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // User Name
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Birth Date
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Birth Date',
                    filled: true,
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  readOnly: true,
                  onTap: _selectDate,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your birth date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Height
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Height (cm)',
                    filled: true,
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your height';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Height must be a number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Weight
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                    filled: true,
                    prefixIcon: Icon(Icons.monitor_weight),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your weight';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Weight must be a number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Gender Selection
                Row(
                  children: [
                    const Text(
                      'Select gender:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Radio<String>(
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) => setState(() => selectedGender = value),
                    ),
                    const Text('Male', style: TextStyle(fontSize: 15)),
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) => setState(() => selectedGender = value),
                    ),
                    const Text('Female', style: TextStyle(fontSize: 15)),
                  ],
                ),
                if (selectedGender == null)
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      'Please select a gender',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 30),

                // Submit Button
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate() && selectedGender != null) {
                      await FirebaseFirestore.instance.collection('Data').doc(currentUser!.email).set({
                        'name': _userController.text,
                        'birthdate': _dateController.text,
                        'height': _heightController.text,
                        'weight': double.tryParse(_weightController.text.trim()) ?? 0.0,
                        'gender': selectedGender!,
                      });

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home_page()),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }
}
