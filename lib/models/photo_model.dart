class Photo {
  final String id;
  final String url;
  final DateTime dateTaken;
  final String title;
  bool isLiked;
  bool isTrashed;

  Photo({
    required this.id,
    required this.url,
    required this.dateTaken,
    required this.title,
    this.isLiked = false,
    this.isTrashed = false,
  });
}