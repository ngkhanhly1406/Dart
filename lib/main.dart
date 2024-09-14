import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Manager',
      home: SongManagementPage(),
    );
  }
}

class Song {
  String title;
  String artist;
  int year;

  Song(this.title, this.artist, this.year);
}

class SongManagementPage extends StatefulWidget {
  @override
  _SongManagementPageState createState() => _SongManagementPageState();
}

class _SongManagementPageState extends State<SongManagementPage> {
  final List<Song> _songs = [];
  final _titleController = TextEditingController();
  final _artistController = TextEditingController();
  final _yearController = TextEditingController();

  void _addSong() {
    setState(() {
      _songs.add(Song(
        _titleController.text,
        _artistController.text,
        int.tryParse(_yearController.text) ?? 0,
      ));
      _titleController.clear();
      _artistController.clear();
      _yearController.clear();
    });
  }

  void _deleteSong(int index) {
    setState(() {
      _songs.removeAt(index);
    });
  }

  void _updateSong(int index, Song song) {
    setState(() {
      _songs[index] = song;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Manager'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Song Title'),
            ),
            TextField(
              controller: _artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: _yearController,
              decoration: InputDecoration(labelText: 'Year'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addSong,
              child: Text('Add Song'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _songs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${_songs[index].title} by ${_songs[index].artist} (${_songs[index].year})'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteSong(index),
                    ),
                    onTap: () {
                      _titleController.text = _songs[index].title;
                      _artistController.text = _songs[index].artist;
                      _yearController.text = _songs[index].year.toString();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Update Song'),
                          content: Column(
                            children: [
                              TextField(
                                controller: _titleController,
                                decoration: InputDecoration(labelText: 'Song Title'),
                              ),
                              TextField(
                                controller: _artistController,
                                decoration: InputDecoration(labelText: 'Artist'),
                              ),
                              TextField(
                                controller: _yearController,
                                decoration: InputDecoration(labelText: 'Year'),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _updateSong(index, Song(
                                  _titleController.text,
                                  _artistController.text,
                                  int.tryParse(_yearController.text) ?? 0,
                                ));
                              },
                              child: Text('Update'),
                            ),
                          ],
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
}
