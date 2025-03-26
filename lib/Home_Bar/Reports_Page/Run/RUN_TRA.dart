import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}
class _StopwatchScreenState extends State<StopwatchScreen> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  List<Map<String, String>> _records = [];
  String _selectedActivity = 'Running';
  String _formattedTime() {
    final duration = _stopwatch.elapsed;
    final minutes =
    duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
    duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final milliseconds = (duration.inMilliseconds.remainder(1000) ~/
        10).toString().padLeft(2, '0');
    return "$minutes:$seconds.$milliseconds";
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }
  void _stopTimer() {
    _timer.cancel();
  }
  void _saveRecord() {
    final now = DateTime.now();
    final formattedDate = "${now.year}-${now.month.toString().padLeft(2,
        '0')}-${now.day.toString().padLeft(2, '0')}";
    final formattedTime = "${now.hour.toString().padLeft(2,
        '0')}:${now.minute.toString().padLeft(2,
        '0')}:${now.second.toString().padLeft(2, '0')}";

    setState(() {
      _records.insert(0, {
        "time": _formattedTime(),
        "datetime": "$formattedDate $formattedTime",
        "activity": _selectedActivity
      });
      _stopwatch.reset();
      _saveHistory();
    });
  }

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/history.json';
  }

  Future<void> _saveHistory() async {
    final filePath = await _getFilePath();
    final file = File(filePath);
    final data = jsonEncode(_records);
    await file.writeAsString(data);
    print('History saved to $filePath');
  }

  Future<void> _loadHistory() async {
    final filePath = await _getFilePath();
    final file = File(filePath);
    if (await file.exists()) {
      final data = await file.readAsString();
      setState(() {
        _records = List<Map<String, String>>.from(jsonDecode(data));
      });
      print('History loaded from $filePath');
    }
  }

  Future<void> _clearHistory() async {
    final filePath = await _getFilePath();
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
      setState(() {
        _records.clear();
      });
      print('History cleared.');
    }
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _loadHistory();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Stopwatch',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formattedTime(),
              style: TextStyle(fontSize: 48, fontWeight:
              FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedActivity,
              items: [
                DropdownMenuItem(value: 'Running', child:
                Text('Running')),
                DropdownMenuItem(value: 'Walking', child:
                Text('Walking')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedActivity = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_stopwatch.isRunning) {
                        _stopwatch.stop();
                        _stopTimer();
                      } else {
                        _stopwatch.start();
                        _startTimer();
                      }
                    });
                  },
                  child: Text(_stopwatch.isRunning ? 'Stop' : 'Start'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_stopwatch.isRunning) {
                      _stopwatch.stop();
                      _stopTimer();
                    }
                    _saveRecord();
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _clearHistory,
                  child: Text('Clear History'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  return Container(
                      color: index % 2 == 0 ? Colors.grey[200] :
                      Colors.white,
                      child: ListTile(
                      title: Text('Record ${_records.length - index}: ${_records[index]["time"]}'),
                      subtitle: Text('${_records[index]["datetime"]} ${_records[index]["activity"]}'),
                  ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 