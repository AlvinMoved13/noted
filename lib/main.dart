import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteApp(),
    );
  }
}

class NoteApp extends StatefulWidget {
  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<Map<String, String?>> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Catatan'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul Catatan'),
            ),
          ),
          ListTile(
            title: TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Isi Catatan'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    titleController.clear();
                    contentController.clear();
                  });
                },
                icon: Icon(Icons.delete),
                label: Text('Clear'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700]), // Warna abu-abu tua
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    String title = titleController.text;
                    String content = contentController.text;
                    if (title.isNotEmpty || content.isNotEmpty) {
                      notes.add({'title': title, 'content': content});
                      titleController.clear();
                      contentController.clear();
                    }
                  });
                },
                icon: Icon(Icons.save),
                label: Text('Save'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(note['title'] ?? ''),
                    subtitle: Text(note['content'] ?? ''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
