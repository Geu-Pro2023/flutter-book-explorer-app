import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package for state management
import '../providers/theme_provider.dart'; // Import the ThemeProvider to manage the theme

/// The [SettingScreen] widget provides users with a settings page where they can
/// toggle various settings like dark mode, font size, language, notifications, and more.
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double _fontSize = 14.0; // Default font size
  bool _notificationsEnabled = true; // Default notifications state
  String selectedLanguage = 'English'; // Default language selected

  @override
  Widget build(BuildContext context) {
    // Using the ThemeProvider to access theme settings
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // Dynamic title based on the selected language
        title: Text(selectedLanguage == 'English'
            ? 'Settings'
            : _translate('Settings', selectedLanguage)),
        centerTitle: true,
        backgroundColor: Colors.green, // Set the background color to green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dark Mode Toggle
            SwitchListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Dark Mode'
                  : _translate('Dark Mode', selectedLanguage)),
              value:
                  themeProvider.isDarkMode, // Get the current dark mode state
              onChanged: (bool value) {
                themeProvider.toggleTheme(); // Toggle dark mode state
              },
              secondary: const Icon(Icons.brightness_6, color: Colors.green),
            ),
            const Divider(),

            // Font Size Adjuster
            ListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Adjust Font Size'
                  : _translate('Adjust Font Size', selectedLanguage)),
              subtitle: Text(selectedLanguage == 'English'
                  ? 'Change font size across the app.'
                  : _translate(
                      'Change font size across the app.', selectedLanguage)),
              leading: const Icon(Icons.text_fields, color: Colors.green),
              onTap: () {
                _showFontSizeDialog(
                    context); // Show font size dialog when tapped
              },
            ),
            const Divider(),

            // Language Selection
            ListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Select Language'
                  : _translate('Select Language', selectedLanguage)),
              subtitle: Text(selectedLanguage == 'English'
                  ? 'Change the app language.'
                  : _translate('Change the app language.', selectedLanguage)),
              leading: const Icon(Icons.language, color: Colors.green),
              onTap: () {
                _showLanguageSelectionDialog(
                    context); // Show language selection dialog
              },
            ),
            const Divider(),

            // Notifications Toggle
            SwitchListTile(
              title: Text(
                selectedLanguage == 'English'
                    ? 'Enable Notifications'
                    : _translate('Enable Notifications', selectedLanguage),
              ),
              subtitle: Text(
                selectedLanguage == 'English'
                    ? 'Turn on or off app notifications.'
                    : _translate(
                        'Turn on or off app notifications.', selectedLanguage),
              ),
              value: _notificationsEnabled, // Get current notifications state
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value; // Toggle notifications state
                });
                // Show a snackbar to notify the user about the change
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value
                          ? (selectedLanguage == 'English'
                              ? 'Notifications Enabled'
                              : _translate(
                                  'Notifications Enabled', selectedLanguage))
                          : (selectedLanguage == 'English'
                              ? 'Notifications Disabled'
                              : _translate(
                                  'Notifications Disabled', selectedLanguage)),
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        Colors.green, // Green background for snackbar
                  ),
                );
              },
              secondary: const Icon(Icons.notifications, color: Colors.green),
            ),
            const Divider(),

            // Send Feedback
            ListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Send Feedback'
                  : _translate('Send Feedback', selectedLanguage)),
              subtitle: Text(selectedLanguage == 'English'
                  ? 'Share your thoughts with us.'
                  : _translate(
                      'Share your thoughts with us.', selectedLanguage)),
              leading: const Icon(Icons.feedback, color: Colors.green),
              onTap: () {
                _showFeedbackDialog(context); // Show feedback dialog
              },
            ),
            const Divider(),

            // Reset to Default
            ListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Reset to Default'
                  : _translate('Reset to Default', selectedLanguage)),
              subtitle: Text(selectedLanguage == 'English'
                  ? 'Reset all settings to default.'
                  : _translate(
                      'Reset all settings to default.', selectedLanguage)),
              leading: const Icon(Icons.restore, color: Colors.green),
              onTap: () {
                // Reset all settings to default
                setState(() {
                  _fontSize = 14.0;
                  _notificationsEnabled = true;
                  selectedLanguage = 'English';
                });
                // Show a snackbar to notify the user about the reset
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      selectedLanguage == 'English'
                          ? 'Settings reset to default.'
                          : _translate(
                              'Settings reset to default.', selectedLanguage),
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
            const Divider(),

            // Privacy Policy
            ListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Privacy Policy'
                  : _translate('Privacy Policy', selectedLanguage)),
              subtitle: Text(selectedLanguage == 'English'
                  ? 'View the privacy policy.'
                  : _translate('View the privacy policy.', selectedLanguage)),
              leading: const Icon(Icons.privacy_tip, color: Colors.green),
              onTap: () {
                // Implement privacy policy logic
              },
            ),
            const Divider(),

            // Contact Support
            ListTile(
              title: Text(selectedLanguage == 'English'
                  ? 'Contact Support'
                  : _translate('Contact Support', selectedLanguage)),
              subtitle: Text(selectedLanguage == 'English'
                  ? 'Get help from our support team.'
                  : _translate(
                      'Get help from our support team.', selectedLanguage)),
              leading: const Icon(Icons.support_agent, color: Colors.green),
              onTap: () {
                // Implement support contact logic
              },
            ),
          ],
        ),
      ),
    );
  }

  // Font Size Dialog to adjust the font size
  void _showFontSizeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectedLanguage == 'English'
              ? 'Adjust Font Size'
              : _translate('Adjust Font Size', selectedLanguage)),
          content: Slider(
            value: _fontSize, // Current font size value
            min: 10.0, // Minimum font size
            max: 30.0, // Maximum font size
            divisions: 10, // Divisions for the slider
            onChanged: (double value) {
              setState(() {
                _fontSize = value; // Update font size
              });
            },
          ),
          actions: [
            TextButton(
              child: Text(selectedLanguage == 'English'
                  ? 'Cancel'
                  : _translate('Cancel', selectedLanguage)),
              onPressed: () => Navigator.pop(context), // Close the dialog
            ),
            TextButton(
              child: Text(selectedLanguage == 'English'
                  ? 'Apply'
                  : _translate('Apply', selectedLanguage)),
              onPressed: () {
                // Apply font size logic here (e.g., update theme globally)
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Language Selection Dialog
  void _showLanguageSelectionDialog(BuildContext context) {
    List<String> languages = [
      'English',
      'German',
      'Spanish',
      'French',
      'Italian',
      'Chinese',
      'Japanese',
      'Arabic',
      'Portuguese',
      'Russian'
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectedLanguage == 'English'
              ? 'Select Language'
              : _translate('Select Language', selectedLanguage)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: languages.map((language) {
              return RadioListTile(
                title: Text(language),
                value: language,
                groupValue: selectedLanguage, // The selected language
                onChanged: (String? value) {
                  setState(() {
                    selectedLanguage = value!; // Update the selected language
                  });
                  Navigator.pop(context); // Close the dialog
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // Feedback Dialog to capture user feedback
  void _showFeedbackDialog(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectedLanguage == 'English'
              ? 'Send Feedback'
              : _translate('Send Feedback', selectedLanguage)),
          content: TextField(
            controller: feedbackController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: selectedLanguage == 'English'
                  ? 'Enter your feedback here...'
                  : _translate('Enter your feedback here...', selectedLanguage),
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text(selectedLanguage == 'English'
                  ? 'Cancel'
                  : _translate('Cancel', selectedLanguage)),
              onPressed: () => Navigator.pop(context), // Close the dialog
            ),
            TextButton(
              child: Text(selectedLanguage == 'English'
                  ? 'Submit'
                  : _translate('Submit', selectedLanguage)),
              onPressed: () {
                // Implement feedback submission logic
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Helper method to translate text based on the selected language
  String _translate(String text, String language) {
    Map<String, Map<String, String>> translations = {
      'German': {
        'Settings': 'Einstellungen',
        'Dark Mode': 'Dunkelmodus', // Add more translations here
      },
      'Spanish': {
        'Settings': 'Configuraciones',
        'Dark Mode': 'Modo Oscuro', // Add more translations here
      },
      // Add other languages here as necessary
    };
    return translations[language]?[text] ??
        text; // Return translated text or default text
  }
}
