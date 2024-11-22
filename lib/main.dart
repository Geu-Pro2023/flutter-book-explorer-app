import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For FontAwesome icons

// Importing screen files
import 'screens/home_screen.dart';
import 'screens/book_screen.dart';
import 'screens/search_screen.dart';
import 'screens/setting_screen.dart';

// Importing theme provider to manage dark and light modes
import 'providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          ThemeProvider(), // Initializes the ThemeProvider to manage theme state
      child: const MyApp(), // Launches the main app
    ),
  );
}

/// The root widget of the application.
/// It builds the app and applies the selected theme (dark or light)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the theme state using Provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Book Explorer', // The title of the app, visible in the taskbar
      theme: themeProvider.isDarkMode
          ? ThemeData.dark() // Applies dark theme if isDarkMode is true
          : ThemeData.light(), // Applies light theme if isDarkMode is false
      home: const MyHomePage(), // Sets the home page of the app
      debugShowCheckedModeBanner: false, // Disables the debug banner on top
    );
  }
}

/// Home Page of the application
/// Displays a BottomNavigationBar with four tabs: Home, Search, Books, and Settings
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Tracks the selected tab index (starts at 0 for Home)

  // List of screens corresponding to each BottomNavigationBar item
  final List<Widget> _screens = const [
    HomeScreen(), // Home Screen
    SearchScreen(), // Search Screen
    BookScreen(), // Books Screen
    SettingScreen(), // Settings Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[
          _currentIndex], // Displays the selected screen based on _currentIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlights the selected tab
        onTap: (index) {
          // Updates the selected tab index when a tab is tapped
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: true, // Displays labels for selected items
        showUnselectedLabels: true, // Displays labels for unselected items
        backgroundColor:
            Colors.green, // Sets the background color for the navigation bar
        selectedItemColor: Colors.green, // Sets the color for selected items
        unselectedItemColor:
            Colors.green, // Sets the color for unselected items
        selectedLabelStyle: const TextStyle(
          fontSize: 14, // Font size for selected labels
          fontWeight: FontWeight.bold, // Bold text for selected labels
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12, // Font size for unselected labels
          fontWeight: FontWeight.normal, // Normal text for unselected labels
        ),
        items: [
          // Navigation items for each tab
          _bottomNavItem(
            icon: FontAwesomeIcons.house, // Home icon
            label: 'Home', // Label for the home tab
          ),
          _bottomNavItem(
            icon: FontAwesomeIcons.magnifyingGlass, // Search icon
            label: 'Search', // Label for the search tab
          ),
          _bottomNavItem(
            icon: FontAwesomeIcons.book, // Books icon
            label: 'Books', // Label for the books tab
          ),
          _bottomNavItem(
            icon: FontAwesomeIcons.gear, // Settings icon
            label: 'Settings', // Label for the settings tab
          ),
        ],
      ),
    );
  }

  /// Creates a BottomNavigationBarItem with custom styling
  /// Adds a green background behind the icon and sets other styling properties
  BottomNavigationBarItem _bottomNavItem({
    required IconData icon, // Icon for the tab
    required String label, // Label for the tab
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8.0), // Adds padding around the icon
        decoration: BoxDecoration(
          color: Colors.green, // Sets the background color for the icon
          borderRadius: BorderRadius.circular(8.0), // Rounds the corners
        ),
        child: FaIcon(
          icon, // Displays the FontAwesome icon
          color: Colors.white, // Icon color remains white
          size: 30.0, // Icon size
        ),
      ),
      label: label, // Sets the label for the tab
    );
  }
}
