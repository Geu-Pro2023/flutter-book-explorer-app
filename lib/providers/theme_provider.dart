import 'package:flutter/material.dart'; // For using ChangeNotifier and notifying listeners

/// A provider class to manage the theme (light/dark mode) of the app.
class ThemeProvider with ChangeNotifier {
  // Private variable to store the theme state (false = light mode, true = dark mode)
  bool _isDarkMode = false;

  /// Getter to retrieve the current theme state.
  ///
  /// Returns: A boolean indicating whether the app is in dark mode.
  bool get isDarkMode => _isDarkMode;

  /// Method to toggle between dark and light themes.
  ///
  /// This method switches the current theme state (dark mode ↔ light mode)
  /// and notifies listeners about the change.
  void toggleTheme() {
    // Switch the theme mode
    _isDarkMode = !_isDarkMode;

    // Notify all listeners (usually the UI) that the state has changed
    notifyListeners();
  }
}
