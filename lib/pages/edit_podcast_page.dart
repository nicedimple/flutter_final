import 'package:flutter/material.dart';
import '../models/podcast.dart'; // Import the Podcast model

class EditPodcastPage extends StatefulWidget {
  final Podcast podcast;

  EditPodcastPage({required this.podcast});

  @override
  _EditPodcastPageState createState() => _EditPodcastPageState();
}

class _EditPodcastPageState extends State<EditPodcastPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.podcast.title);
    _descriptionController =
        TextEditingController(text: widget.podcast.description);
  }

  // Save the edited podcast and return it
  void _savePodcast() {
    final updatedPodcast = Podcast(
      id: widget.podcast.id,
      title: _titleController.text,
      description: _descriptionController.text,
      imageUrl: widget.podcast.imageUrl,
    );

    // Return the updated podcast to the previous page
    Navigator.pop(context, updatedPodcast);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Podcast'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Podcast Title'),
            ),
            SizedBox(height: 20),
            Text('Edit Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Podcast Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePodcast,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
