import 'package:flutter/material.dart';
import '../models/book_model.dart'; // Import the model for Book
import '../providers/book_provider.dart'; // Import the provider for fetching book data
import '../widgets/book_card.dart'; // Import the custom BookCard widget

/// The [BookScreen] widget is responsible for displaying a list of books
/// fetched from the API. It uses a [StatefulWidget] to manage the loading
/// state and display the list of books when they are available.
class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<Book> _books = []; // List to store the fetched books
  bool _isLoading = true; // Flag to track loading state

  /// This getter for `green` is currently unused and can be removed,
  /// or you can provide a value to indicate the color you want to use.
  get green => null;

  @override
  void initState() {
    super.initState();
    _fetchBooks(); // Fetch books when the screen is initialized
  }

  /// Asynchronously fetches books based on a search query.
  ///
  /// This function uses the [BookProvider] to search for books with the query
  /// 'programming' (this can be changed based on requirements). Once the data
  /// is fetched, the UI is updated with [setState].
  Future<void> _fetchBooks() async {
    try {
      final books = await BookProvider.searchBooks('programming');
      // Example query for programming books
      setState(() {
        _books = books; // Update the list of books
        _isLoading = false; // Data is loaded, set loading flag to false
      });
    } catch (error) {
      // Handle error if book fetching fails
      setState(() {
        _isLoading = false; // Stop loading in case of an error
      });
      // In a real application, you could show an error message here
    }
  }

  @override
  Widget build(BuildContext context) {
    // Builds the UI of the BookScreen widget
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books', // Title of the screen
          style: TextStyle(fontSize: 24), // Title style with larger font
        ),
        centerTitle: true, // Center the title in the AppBar
        backgroundColor: Colors.green, // Set the background color to green
      ),
      body: _isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading spinner when fetching
          : ListView.builder(
              itemCount: _books.length, // Number of books to display
              itemBuilder: (context, index) {
                // Build the UI for each book using the custom BookCard widget
                return BookCard(
                  book: _books[index], // Pass the current book to BookCard
                  color:
                      green, // Currently unused color parameter (can be modified or removed)
                );
              },
            ),
    );
  }
}
