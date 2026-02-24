class Book {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  Book({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

  /// Convert JSON to Dart object
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      number: json['number'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['originalTitle'] ?? '',
      releaseDate: json['releaseDate'] ?? '',
      description: json['description'] ?? '',
      pages: json['pages'] ?? 0,
      cover: json['cover'] ?? '',
      index: json['index'] ?? 0,
    );
  }

  /// Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'title': title,
      'originalTitle': originalTitle,
      'releaseDate': releaseDate,
      'description': description,
      'pages': pages,
      'cover': cover,
      'index': index,
    };
  }

  /// Convert List JSON to List<Book>
  static List<Book> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Book.fromJson(json)).toList();
  }

  /// Convert List<Book> to List JSON
  static List<Map<String, dynamic>> listToJson(List<Book> books) {
    return books.map((book) => book.toJson()).toList();
  }
}