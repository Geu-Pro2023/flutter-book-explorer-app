import 'package:flutter/material.dart';
import '../models/book_model.dart'; // Import the Book model to represent books
import '../providers/book_provider.dart'; // Import the Book provider for fetching book data
import '../widgets/book_card.dart'; // Import the custom BookCard widget to display each book

/// The [SearchScreen] widget is responsible for allowing users to search for books
/// based on a search query. It uses a [StatefulWidget] to manage the state of the
/// search query, results, and loading indicator.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController =
      TextEditingController(); // Controller for the search input
  List<Book> _searchResults = []; // List to store search results
  bool _isLoading = false; // Flag to track loading state during search

  /// Unused `green` getter, which can be removed or assigned a meaningful value.
  get green => null;

  /// This function performs the book search when the user submits a query.
  /// It sends the search query to [BookProvider.searchBooks] and updates the UI
  /// with the results. It also manages the loading state.
  Future<void> _searchBooks() async {
    // If the search query is empty, do nothing
    if (_searchController.text.isEmpty) return;

    // Show loading indicator
    setState(() => _isLoading = true);

    // Fetch search results from the provider
    final results = await BookProvider.searchBooks(_searchController.text);

    // Update the state with the fetched results
    setState(() {
      _searchResults = results;
      _isLoading = false; // Hide loading indicator after the results are loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with the title of the screen
      appBar: AppBar(
        title: const Text(
          'Search Books', // Title of the screen
          style: TextStyle(fontSize: 24), // Font size for the title
        ),
        centerTitle: true, // Center the title in the AppBar
        backgroundColor: Colors.green, // Set the app bar color to green
      ),
      body: Column(
        children: [
          // Search input field wrapped in a container with rounded corners and border
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors
                    .green.shade50, // Light green background for the search box
                borderRadius: BorderRadius.circular(
                    30), // Rounded corners for the search box
                border: Border.all(
                  color: Colors.green.shade700, // Darker green border color
                  width: 2, // Border width
                ),
              ),
              child: TextField(
                controller: _searchController, // Assign the search controller
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: Icon(
                    Icons.search_off, // Search icon
                    color:
                        Colors.green.shade800, // Dark green color for the icon
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear, // Clear icon to clear the search query
                      color: Colors.green.shade800,
                    ),
                    onPressed: () {
                      _searchController
                          .clear(); // Clear the search input when pressed
                    },
                  ),
                  hintText:
                      'Search for books...', // Hint text in the search box
                  hintStyle: TextStyle(
                      color: Colors.green.shade400), // Hint text color
                  border: InputBorder
                      .none, // Remove the default border from the text field
                ),
                onSubmitted: (value) =>
                    _searchBooks(), // Trigger search on 'Enter' key press
              ),
            ),
          ),
          // Conditional rendering: show loading indicator or the search results
          _isLoading
              ? const CircularProgressIndicator() // Show loading spinner while searching
              : Expanded(
                  child: ListView.builder(
                    itemCount: _searchResults
                        .length, // Set the number of items in the list
                    itemBuilder: (context, index) {
                      // Return a BookCard widget for each book in the search results
                      return BookCard(
                        book: _searchResults[
                            index], // Pass the current book as an argument
                        color:
                            green, // Currently unused, can be removed or modified
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
