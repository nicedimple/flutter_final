// lib/services/podcast_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/podcast.dart'; // Make sure to import the Podcast model

Future<List<Podcast>> fetchPodcasts() async {
  final response =
      await http.get(Uri.parse('https://api.example.com/podcasts'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => Podcast.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load podcasts');
  }
}
