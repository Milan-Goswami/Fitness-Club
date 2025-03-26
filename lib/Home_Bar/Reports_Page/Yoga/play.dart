import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lottie/lottie.dart';
class play extends StatefulWidget {
  final String path;
  final String name;
  play({required this.name,required this.path});

  @override
  State<play> createState() => _playState();
}

class _playState extends State<play> {
  List<FileSystemEntity> audioFiles = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? file_index;
  String? _audiopath;
  double _currentVolume = 0.5;
  String? curpath;
  String? curname;
  bool _isPlaying = true;
  bool _isStopped = true;
  double _currentPosition = 0.0;
  double _volume = 0.5;
  Duration _duration = Duration.zero;
  Duration _currentDuration = Duration.zero;

  String _errorMessage = ""; // Error message for out of range validation

  @override
  void initState() {
    super.initState();
    curpath=widget.path;
    curname=widget.name;
    print(curpath);
    print(curname);
    print(audioFiles);
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _currentDuration = p;
        _currentPosition = p.inSeconds.toDouble();
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
    _audioPlayer.play(UrlSource(curpath!));

  }

  // Play/Pause the audio
  Future<void> _togglePlayPause() async {
    if (curpath == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(DeviceFileSource(curpath!));
    }

    setState(() {
      _isPlaying = !_isPlaying;
      _isStopped = false;
    });
  }

  // Stop the audio
  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
      _isStopped = true;
      _currentPosition = 0.0;
    });
  }

  // Seek the audio to a specific position
  void _seekTo(double value) {
    if (value < 0.0) {
      setState(() {
        _errorMessage = "Cannot go below 0 seconds.";
      });
      value = 0.0;  // Ensure the position doesn't go below 0
    } else if (value > _duration.inSeconds.toDouble()) {
      setState(() {
        _errorMessage = "Cannot go beyond audio duration.";
      });
      value = _duration.inSeconds.toDouble();  // Ensure the position doesn't go beyond the audio duration
    } else {
      setState(() {
        _errorMessage = "";  // Clear error message if within range
      });
    }
    _audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  // Change volume of audio playback
  void _setVolume(double value) {
    if(value>0.0 && value<1.00){
      setState(() {
        _volume = value;
      });
    }
    else{
      value>0.0?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("AUDIO IS MAXIMUM"),duration: Duration(milliseconds: 200),)):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("AUDIO IS MINIMUM"),duration: Duration(milliseconds: 200),));
    }
  }

  // Format Duration
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PLAY"),elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(child: Text(curname!,style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(color:Colors.grey.shade300,elevation: 10,child: Lottie.asset("assets/Music.json",width: 300,height: 300,fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(elevation: 6,
                        child: IconButton(
                          icon: Icon(Icons.replay_10,size: 30,color: Colors.green,),
                          onPressed: () {
                            _seekTo(_currentPosition - 10);
                          },
                        ),
                      ),
                      Card(elevation: 6,
                        child: IconButton(
                          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,size: 30,color: _isPlaying?Colors.red:Colors.blue,),
                          onPressed: _togglePlayPause,
                        ),
                      ),
                      Card(elevation: 6,
                        child: IconButton(
                          icon: Icon(Icons.stop,size: 30,color: Colors.red,),
                          onPressed: _stopAudio,
                        ),
                      ),
                      Card(elevation: 6,
                        child: IconButton(
                          icon: Icon(Icons.forward_10,size: 30,color: Colors.green),
                          onPressed: () {
                            _seekTo(_currentPosition + 10);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Playback Slider (Position of the audio)
              Container(
                child: Slider(
                  value: _currentPosition,
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _seekTo(value);
                  },
                ),
              ),

              // Duration display
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_formatDuration(_currentDuration)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_formatDuration(_duration)),
                    ),
                  ],
                ),
              ),

              // Volume control
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 6,
                      child: IconButton(
                        icon: Icon(Icons.volume_down),
                        onPressed: () => _setVolume(_volume - 0.1),
                      ),
                    ),
                    Slider(
                      value: _volume,
                      min: 0.0,
                      max: 1.0,
                      onChanged: _setVolume,
                    ),
                    Card(elevation: 6,
                      child: IconButton(
                        icon: Icon(Icons.volume_up),
                        onPressed: () => _setVolume(_volume + 0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
