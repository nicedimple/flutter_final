import 'package:flutter/material.dart';
import '../models/podcast.dart'; // Import the Podcast model
import 'edit_podcast_page.dart'; // Import the EditPodcastPage

class PodcastListPage extends StatefulWidget {
  @override
  _PodcastListPageState createState() => _PodcastListPageState();
}

class _PodcastListPageState extends State<PodcastListPage> {
  // Hardcoded list of podcasts
  List<Podcast> podcasts = [
    Podcast(
      id: 1,
      title: 'The Tech Talks Daily',
      description:
          'The Tech Talks Daily podcast focuses on real-world applications and business strategies.',
      imageUrl: 'assets/images/podcast1.jpeg',
    ),
    Podcast(
      id: 2,
      title: 'True Crime Files',
      description: 'Fact is scarier that fiction.',
      imageUrl: 'assets/images/podcast2.jpg',
    ),
    Podcast(
      id: 3,
      title: 'History Unveiled',
      description: 'Unlock the secrets of history with History Unveiled.',
      imageUrl: 'assets/images/podcast3.jpeg',
    ),
    // Add more podcasts as needed
  ];

  // Function to delete a podcast
  void _deletePodcast(int id) {
    setState(() {
      podcasts.removeWhere(
          (podcast) => podcast.id == id); // Remove the podcast by ID
    });
  }

  // Function to edit a podcast
  void _editPodcast(int id) async {
    final podcast = podcasts.firstWhere((podcast) => podcast.id == id);
    final updatedPodcast = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPodcastPage(podcast: podcast),
      ),
    );

    if (updatedPodcast != null) {
      setState(() {
        // Update the podcast list with the edited podcast
        int index = podcasts.indexWhere((podcast) => podcast.id == id);
        podcasts[index] = updatedPodcast;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Podcasts',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: podcasts.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Image.asset(
                    podcasts[index].imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    podcasts[index].title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    podcasts[index].description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editPodcast(podcasts[index].id),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deletePodcast(podcasts[index].id),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
