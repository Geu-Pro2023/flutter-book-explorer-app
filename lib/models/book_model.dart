class Book {
  final String title; // The title of the book
  final String author; // The author(s) of the book
  final String imageUrl; // The URL to the book's cover image
  final String url; // The URL to the book's page on OpenLibrary

  // Constructor to initialize the Book object with the required properties
  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.url,
  });

  /// A factory constructor to create a Book instance from a JSON object.
  /// This method handles parsing the JSON data and assigning values to
  /// the Book class properties.
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ??
          'No Title', // Defaults to 'No Title' if the title is not available
      author: (json['author_name'] ?? ['Unknown'])
          .join(', '), // Joins multiple authors, defaults to 'Unknown'
      imageUrl: json['cover_i'] != null
          // Constructs the cover image URL if available, otherwise uses a placeholder
          ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-M.jpg'
          : 'https://via.placeholder.com/150', // Placeholder image URL
      url: json['key'] != null
          // Constructs the URL for the book's page on OpenLibrary if the key is available
          ? 'https://openlibrary.org${json['key']}'
          : '', // Returns an empty string if the URL key is not available
    );
  }
}
