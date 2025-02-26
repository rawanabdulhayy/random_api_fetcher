class Quote {
  final String id;
  final String content;
  final String author;
  final String authorSlug;
  final String authorId;
  final List<String> tags;
  final int length;

  Quote({
    required this.id,
    required this.content,
    required this.author,
    required this.authorSlug,
    required this.authorId,
    required this.tags,
    required this.length,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'] ?? '',
      content: json['content'] ?? '',
      author: json['author'] ?? '',
      authorSlug: json['authorSlug'] ?? '',
      authorId: json['authorId'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      length: json['length'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'author': author,
      'authorSlug': authorSlug,
      'authorId': authorId,
      'tags': tags,
      'length': length,
    };
  }
}
