import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YogaVideoScreen extends StatefulWidget {
  @override
  _YogaVideoScreenState createState() => _YogaVideoScreenState();
}

class _YogaVideoScreenState extends State<YogaVideoScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addVideo(String title, String description, String url) async {
    try {
      await _firestore.collection('yoga_video').add({
        'title': title,
        'description': description,
        'url': url,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Yoga video added successfully!'),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding video: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _showAddVideoSheet() {
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Yoga Video',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 20),
              _buildTextField(titleController, 'Video Title'),
              SizedBox(height: 10),
              _buildTextField(descriptionController, 'Description'),
              SizedBox(height: 10),
              _buildTextField(urlController, 'YouTube URL'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String title = titleController.text.trim();
                  String description = descriptionController.text.trim();
                  String url = urlController.text.trim();

                  if (title.isNotEmpty && description.isNotEmpty && url.isNotEmpty) {
                    addVideo(title, description, url);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please fill in all fields'),
                      backgroundColor: Colors.orange,
                    ));
                  }
                },
                child: Text('Add Video',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  // Delete video from Firestore
  void deleteVideo(String videoId) async {
    try {
      await _firestore.collection('yoga_video').doc(videoId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Video deleted successfully'),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting video: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Video Library'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddVideoSheet();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade600, Colors.purple.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('yoga_video').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final videoDocs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: videoDocs.length,
                    itemBuilder: (context, index) {
                      var video = videoDocs[index];
                      String? videoUrl = video['url'];
                      String videoId = video.id;

                      if (videoUrl == null) {
                        return ListTile(
                          title: Text(video['title'] ?? 'No Title'),
                          subtitle: Text(video['description'] ?? 'No Description'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteVideo(videoId);  // Delete the video
                            },
                          ),
                        );
                      }

                      String videoIdFromUrl = YoutubePlayer.convertUrlToId(videoUrl)!;

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            video['title'] ?? 'No Title',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                          subtitle: Text(
                            video['description'] ?? 'No Description',
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.play_arrow, color: Colors.purple),
                                onPressed: () {
                                  _navigateToVideoPlayer(videoIdFromUrl);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteVideo(videoId);  // Delete the video
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToVideoPlayer(String videoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YouTubePlayerScreen(videoId: videoId),
      ),
    );
  }
}

class YouTubePlayerScreen extends StatelessWidget {
  final String videoId;

  YouTubePlayerScreen({required this.videoId});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Playing Video'),
        backgroundColor: Colors.purple,
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
