import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Admin_Panel/Home_bar/Diet_Plan_Screen.dart';
import 'package:fitness_club/Admin_Panel/Home_bar/Yoga_Music_Screen.dart';
import 'package:fitness_club/Admin_Panel/Home_bar/Yoga_Video_Screen.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Parallax Background Effect
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.shade200.withOpacity(0.3),
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          // Safe Area
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  // Header with Stylish Typography
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Welcome to Admin Panel",
                      style: GoogleFonts.montserrat(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Cards for each section with hover & tap effects
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildInteractiveCard(
                      context,
                      "Add Yoga Music",
                      "Upload relaxing yoga music for sessions.",
                      Icons.music_note,
                      YogaMusicPlayerScreen(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildInteractiveCard(
                      context,
                      "Add Yoga Videos",
                      "Upload yoga sessions and tutorials.",
                      Icons.video_library,
                      YogaVideoScreen(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildInteractiveCard(
                      context,
                      "Add Diet Plans",
                      "Create and manage custom diet plans.",
                      Icons.local_dining,
                      DietPlanScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Interactive Card with animations, hover & tap effects
  Widget _buildInteractiveCard(BuildContext context, String title, String description, IconData icon, Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          // You can add hover effects here
        },
        onExit: (_) {
          // Reset hover effects here
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          // Set a fixed height for each card or use constraints to avoid layout issues
          height: 180, // You can adjust this height to make the card bigger or smaller
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(0, 10),
              ),
            ],
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              splashColor: Colors.blue.shade300,
              highlightColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => targetScreen),
                );
              },
              child: Row(
                children: [
                  // Icon Section with Custom Style
                  Container(
                    height: double.infinity,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  // Text Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                              decorationColor: Colors.white,
                              decorationThickness: 2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            description,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
