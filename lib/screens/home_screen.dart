import 'package:flutter/material.dart';

/// The [HomeScreen] widget is the main screen of the application that displays
/// a list of featured books along with a welcome message and cover image.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of featured books, each with an image and title
    final List<Map<String, String>> featuredBooks = [
      {'image': 'assets/images/book1.jpeg', 'title': 'Biology'},
      {'image': 'assets/images/book2.jpg', 'title': 'Chemistry'},
      {'image': 'assets/images/book3.jpg', 'title': 'Bible'},
      {'image': 'assets/images/book4.jpeg', 'title': 'Economic'},
    ];

    // Return the Scaffold widget to build the screen
    return Scaffold(
      // AppBar displaying the title of the screen
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 24), // Increased font size for title
        ),
        centerTitle: true, // Center the title in the AppBar
        backgroundColor: Colors.green, // Green app bar color for consistency
      ),
      // Body of the screen with stacked widgets
      body: Stack(
        children: [
          // Scrollable content that includes a cover image and a list of featured books
          SingleChildScrollView(
            child: Column(
              children: [
                // Display cover image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  child: const Image(
                    image: AssetImage('assets/images/cover.jpeg'),
                    width: double.infinity, // Make image span the full width
                    height: 220, // Set image height for emphasis
                    fit: BoxFit
                        .cover, // Ensure the image covers the area without distortion
                  ),
                ),
                const SizedBox(
                    height: 16), // Spacer between cover image and list
                // List of featured books displayed in a column
                Column(
                  children: featuredBooks
                      .map(
                        (book) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0), // Vertical spacing between books
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                12.0), // Rounded corners for book containers
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2), // Shadow direction
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Display book image with rounded corners
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Rounded corners for book images
                                child: Image.asset(
                                  book['image']!, // Access the book image
                                  height: 200, // Set height for the image
                                  width: double
                                      .infinity, // Make image span full width
                                  fit: BoxFit
                                      .cover, // Ensure image fits the container
                                ),
                              ),
                              const SizedBox(
                                  height: 8), // Space between image and title
                              // Display book title
                              Text(
                                book['title']!, // Access the book title
                                style: const TextStyle(
                                  fontSize: 18, // Set font size for title
                                  fontWeight: FontWeight
                                      .bold, // Bold title for emphasis
                                ),
                                textAlign: TextAlign.center, // Center the text
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(), // Convert the list of books into a list of widgets
                ),
              ],
            ),
          ),
          // Centered welcome message displayed on top of other content
          Align(
            alignment: Alignment.center, // Center the welcome message
            child: Container(
              width: double.infinity, // Span full width of the screen
              padding: const EdgeInsets.symmetric(
                vertical:
                    16.0, // Slim vertical padding for the welcome container
              ),
              decoration: const BoxDecoration(
                color:
                    Colors.green, // Set background color to green for emphasis
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2), // Shadow direction for the container
                  ),
                ],
              ),
              child: const Column(
                mainAxisSize:
                    MainAxisSize.min, // Adjust size to the content's needs
                children: [
                  // Welcome message title
                  Text(
                    'Welcome to Book Explorer!',
                    style: TextStyle(
                      fontSize: 24, // Large font size for prominence
                      fontWeight:
                          FontWeight.bold, // Bold to highlight the message
                      color: Colors.white, // White text color for contrast
                    ),
                    textAlign: TextAlign.center, // Center-align the text
                  ),
                  SizedBox(height: 8), // Space between the title and subtitle
                  // Welcome message subtitle
                  Text(
                    'Check the latest edition of your favorite books here.',
                    style: TextStyle(
                      fontSize: 16, // Slightly smaller font for subtitle
                      fontWeight:
                          FontWeight.normal, // Normal weight for the subtitle
                      color: Colors.white, // White text for contrast
                    ),
                    textAlign: TextAlign.center, // Center-align the text
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
