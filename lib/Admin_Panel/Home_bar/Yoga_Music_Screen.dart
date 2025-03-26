import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_club/Admin_Panel/Home_bar/play.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';


class YogaMusicPlayerScreen extends StatefulWidget {
  @override
  _YogaMusicPlayerScreenState createState() => _YogaMusicPlayerScreenState();
}

class _YogaMusicPlayerScreenState extends State<YogaMusicPlayerScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? currentMusicUrl;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();// Initialize JustAudio player here
  }

  // Play or Pause mus

  // Add new music to Firestore
  void addMusic(String title, String description, String url) async {
    try {
      await _firestore.collection('yoga_music').add({
        'title': title,
        'description': description,
        'url': url,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Yoga music added successfully!'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding music: $e'),
      ));
    }
  }

  // Delete music from Firestore
  void deleteMusic(String musicId) async {
    try {
      await _firestore.collection('yoga_music').doc(musicId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Yoga music deleted successfully!'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting music: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yoga Music Player',
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
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: () {
                                deleteMusic(musicId); // Delete music when pressed
                              },
                            ),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddMusicSheet();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
              ),
              child: Text(
                'Add New Yoga Music',
                style: GoogleFonts.poppins(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
              ).animate().scale(begin: Offset(1, 1), end: Offset(1.1, 1.1), duration: Duration(milliseconds: 150), curve: Curves.easeInOut),
            ),
          ),
        ],
      ),
    );
  }

  // Show bottom sheet to add new music
  void _showAddMusicSheet() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController urlController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Yoga Music',
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Music Title',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: urlController,
                decoration: InputDecoration(
                  labelText: 'Music URL',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String title = titleController.text.trim();
                  String description = descriptionController.text.trim();
                  String url = urlController.text.trim();

                  if (title.isNotEmpty && description.isNotEmpty && url.isNotEmpty) {
                    addMusic(title, description, url);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please fill in all fields'),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add Music',
                    style: GoogleFonts.poppins(color:Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}