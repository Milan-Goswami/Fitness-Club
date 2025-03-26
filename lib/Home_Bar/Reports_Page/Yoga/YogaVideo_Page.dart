


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page extends StatefulWidget {
 video_page({super.key});

  @override
  State<video_page> createState() => _video_pageState();
}

class _video_pageState extends State<video_page> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Yoga Video Library',style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
          backgroundColor:   Colors.grey.shade600),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade600, Colors.grey.shade200],
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
                          subtitle: Text(
                              video['description'] ?? 'No Description'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {

                            },
                          ),
                        );
                      }

                      String videoIdFromUrl = YoutubePlayer.convertUrlToId(
                          videoUrl)!;

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
                                icon: Icon(
                                    Icons.play_arrow, color: Colors.purple),
                                onPressed: () {
                                  _navigateToVideoPlayer(videoIdFromUrl);
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

    Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => YouTubePlayerScreen(videoId: videoId),));

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

