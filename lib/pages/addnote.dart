import 'package:flutter/material.dart';

class NewNotePage extends StatefulWidget {
  final Function(String title, String content) onSave; // Callback to save note

  NewNotePage({required this.onSave});

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save note when save button is pressed
              String title = titleController.text.trim();
              String content = contentController.text.trim();
              if (title.isNotEmpty && content.isNotEmpty) {
                widget.onSave(title, content); // Call callback function to save note
                Navigator.pop(context); // Return to the previous screen
              } else {
                // Show an error if title or content is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter both title and content')),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Note Title',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Note Content',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 18),
              maxLines: 10, // Allow multiple lines for content
            ),
          ],
        ),
      ),
    );
  }
}