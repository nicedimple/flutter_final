class Podcast {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Podcast({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  // A function to map JSON data into a Podcast object (if you later decide to use an API again)
  factory Podcast.fromJson(Map<String, dynamic> json) {
    return Podcast(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
