import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // To launch URLs
import '../models/book_model.dart'; // Import the Book model

/// The [BookCard] widget displays a card containing details about a book,
/// such as its title, author, and image. When tapped, it launches a URL
/// to the book's page on OpenLibrary.
class BookCard extends StatelessWidget {
  final Book book; // The Book object containing book details

  // Constructor accepting a [Book] and a color (though color is not used in the widget)
  const BookCard({super.key, required this.book, required color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0), // Margin around the card
      elevation: 5, // Card shadow for elevation effect
      child: ListTile(
        leading: Image.network(
          book.imageUrl, // Book cover image from the network
          width: 50, // Set width of the image
          height: 75, // Set height of the image
          fit: BoxFit.cover, // Ensure image covers the space correctly
        ),
        title: Text(book.title), // Display book title
        subtitle: Text(book.author), // Display book author
        onTap: () async {
          // When tapped, launch the URL to the book's page on OpenLibrary
          final Uri bookUrl =
              Uri.parse(book.url); // Parse the URL from the book model
          if (await canLaunchUrl(bookUrl)) {
            // If the URL can be launched, open it
            await launchUrl(bookUrl);
          } else {
            // If the URL cannot be launched, throw an error
            throw 'Could not launch $bookUrl';
          }
        },
      ),
    );
  }
}
