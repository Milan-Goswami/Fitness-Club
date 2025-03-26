import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietPlanScreen extends StatefulWidget {
  @override
  _DietPlanScreenState createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedType = 'Veg';
  String? selectedGoal = 'Weight Gain';
  final TextEditingController dietPlanController = TextEditingController();

  // Function to add diet plan to Firestore
  void addDietPlan(String type, String goal, String dietPlan) async {
    try {
      await _firestore.collection('diet_plan').add({
        'type': type,
        'goal': goal,
        'diet_plan': dietPlan,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Diet Plan Added Successfully!'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding diet plan: $e'),
      ));
    }
  }

  // Function to delete diet plan from Firestore
  void deleteDietPlan(String docId) async {
    try {
      await _firestore.collection('diet_plan').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Diet Plan Deleted Successfully!'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting diet plan: $e'),
      ));
    }
  }

  // Function to fetch diet plans from Firestore
  Widget _buildDietPlanList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('diet_plan').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final dietPlanDocs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: dietPlanDocs.length,
          itemBuilder: (context, index) {
            var dietPlan = dietPlanDocs[index];
            String type = dietPlan['type'];
            String goal = dietPlan['goal'];
            String planDetails = dietPlan['diet_plan'];
            String docId = dietPlan.id;

            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  "$type - $goal",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  planDetails,
                  style: GoogleFonts.montserrat(fontSize: 14),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Confirm deletion
                    _showDeleteConfirmationDialog(docId);
                  },
                ),
                onTap: () {
                  _showDietPlanPopup(type, goal, planDetails);
                },
              ),
            );
          },
        );
      },
    );
  }

  // Show popup with diet plan details
  void _showDietPlanPopup(String type, String goal, String planDetails) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Diet Plan Details", style: GoogleFonts.montserrat()),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Type: $type", style: GoogleFonts.montserrat()),
              SizedBox(height: 10),
              Text("Goal: $goal", style: GoogleFonts.montserrat()),
              SizedBox(height: 10),
              Text("Diet Plan:", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(planDetails, style: GoogleFonts.montserrat()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close", style: GoogleFonts.montserrat()),
          ),
        ],
      ),
    );
  }

  // Show delete confirmation dialog
  void _showDeleteConfirmationDialog(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Deletion", style: GoogleFonts.montserrat()),
        content: Text(
          "Are you sure you want to delete this diet plan?",
          style: GoogleFonts.montserrat(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              deleteDietPlan(docId); // Delete the diet plan
            },
            child: Text("Yes", style: GoogleFonts.montserrat(color: Colors.red)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context), // Just close the dialog
            child: Text("No", style: GoogleFonts.montserrat()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diet Plan Management',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display Diet Plans
          Expanded(child: _buildDietPlanList()),

          // Add Diet Plan Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Add New Diet Plan',
              style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Type Dropdown
                DropdownButton<String>(
                  value: selectedType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedType = newValue;
                    });
                  },
                  items: ['Veg', 'Non-Veg', 'Vegan']
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.montserrat()),
                    );
                  }).toList(),
                  isExpanded: true,
                  hint: Text("Select Type", style: GoogleFonts.montserrat()),
                ),
                SizedBox(height: 20),
                // Goal Dropdown
                DropdownButton<String>(
                  value: selectedGoal,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGoal = newValue;
                    });
                  },
                  items: ['Weight Gain', 'Burn']
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.montserrat()),
                    );
                  }).toList(),
                  isExpanded: true,
                  hint: Text("Select Goal", style: GoogleFonts.montserrat()),
                ),
                SizedBox(height: 20),
                // Diet Plan Input Field
                TextField(
                  controller: dietPlanController,
                  decoration: InputDecoration(
                    labelText: 'Diet Plan Details',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  maxLines: 5,
                  style: GoogleFonts.montserrat(),
                ),
                SizedBox(height: 20),
                // Add Button with Elevated Styling
                ElevatedButton(
                  onPressed: () {
                    String type = selectedType ?? '';
                    String goal = selectedGoal ?? '';
                    String dietPlan = dietPlanController.text.trim();

                    if (type.isNotEmpty && goal.isNotEmpty && dietPlan.isNotEmpty) {
                      addDietPlan(type, goal, dietPlan);
                      dietPlanController.clear(); // Clear the input field after submission
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please fill all the fields'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                  ),
                  child: Text(
                    'Add Diet Plan',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
