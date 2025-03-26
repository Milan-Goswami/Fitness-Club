
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/Yoga/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class Music_Page extends StatefulWidget {
  const Music_Page({super.key});

  @override
  State<Music_Page> createState() => _Music_PageState();
}

class _Music_PageState extends State<Music_Page> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? currentMusicUrl;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();// Initialize JustAudio player here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Yoga Music Player',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
       backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          // Display music list from Firestore with animation
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('yoga_music').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final musicDocs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: musicDocs.length,
                  itemBuilder: (context, index) {
                    var music = musicDocs[index];
                    String musicId = music.id; // Get document ID
                    String musicUrl = music['url'];
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        title: Text(
                          music['title'],
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(music['description']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                          ],
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => play(name: music.id, path: music['url']),));
                        },
                      ),
                    ).animate().fadeIn(duration: Duration(milliseconds: 500)); // Fade-in animation
                  },
                );
              },
            ),
          ),
          // Button to add new music with animation

        ],
      ),
    );
  }

}
