
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diet_Page extends StatefulWidget {
  const Diet_Page({super.key});

  @override
  State<Diet_Page> createState() => _Diet_PageState();
}

class _Diet_PageState extends State<Diet_Page> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan  ',style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),

        backgroundColor: Colors.transparent,),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(child: _buildDietPlanList()),
        ],
      ),
    );
  }
}
