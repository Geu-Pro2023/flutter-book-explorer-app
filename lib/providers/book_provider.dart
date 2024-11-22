import 'dart:convert'; // For decoding JSON data
import 'package:http/http.dart' as http; // For making HTTP requests
import '../models/book_model.dart'; // Import the Book model to map the data

/// A class that handles fetching books from the OpenLibrary API.
class BookProvider {
  /// Searches for books based on the provided query string.
  ///
  /// This method sends a GET request to the OpenLibrary API and returns a list of
  /// [Book] objects parsed from the response JSON.
  ///
  /// - Parameter query: The search query used to find books (e.g., "flutter").
  /// - Returns: A [Future] that resolves to a list of [Book] objects.
  /// - Throws: An [Exception] if the request fails or returns a non-200 status code.
  static Future<List<Book>> searchBooks(String query) async {
    // Send GET request to OpenLibrary API with the search query
    final response = await http.get(
      Uri.parse('https://openlibrary.org/search.json?q=$query'),
    );

    // Check if the response is successful (status code 200)
    if (response.statusCode == 200) {
      // Decode the JSON response into a Dart map
      final data = json.decode(response.body);

      // Extract the list of books from the 'docs' key (or an empty list if it's null)
      final List books = data['docs'] ?? [];

      // Convert each book's JSON data into a Book object and return as a list
      return books.map((bookData) => Book.fromJson(bookData)).toList();
    } else {
      // If the request fails, throw an exception
      throw Exception('Failed to load books');
    }
  }
}
