# **Book Explorer App**

## **Project Overview**
The Book Explorer App is a Flutter-based mobile application that allows users to search for books, view detailed information about each book, and explore settings such as dark mode and font size adjustments. The app integrates with the **OpenLibrary API** to fetch and display books based on search queries.

## **API Chosen and Its Purpose**
- **API:** [OpenLibrary API](https://openlibrary.org/developers)
- **Purpose:** The OpenLibrary API provides access to many books and their details. It retrieves book information such as title, author, cover image, and external links to the book's page on the OpenLibrary website. This data is fetched based on search queries entered by the user.

## **Screens Created and Their Functionalities**

### **1. Home Screen**
- **Functionality:** Displays the latest published books where users can input queries to search for books and show them in book results fetched from the API based on the search query.
- **Widgets Used:** `TextField`, `ListView`, `ListTile`.

### **2. Search Screen**
- **Functionality:** Allows users to enter a query, search for books, and view the results. Displays a list of books based on the query.
- **Widgets Used:** `TextField`, `ListView`, `ListTile`.

### **3. Book Screen**
- **Functionality:** Displays detailed information about a specific book, such as its title, author, cover image, and a link to the OpenLibrary website.
- **Widgets Used:** `Text`, `Image. network`, `Column`, `FlatButton/ElevatedButton`.

### **4. Setting Screen**
- **Functionality:** Allows users to adjust settings such as dark mode, font size, and language. Changes are reflected across the app.
- **Widgets Used:** `SwitchListTile`, `ListTile`, `Slider`.

## **Screenshots**
### **Portrait Mode Screenshot**
   ![Home Screen Portrait](https://drive.google.com/file/d/1sxnScDHSKF5cf0gzlDPkI86OOtVs27iY/view?usp=drive_link)

### **Landscape Mode Screenshot**
   ![Home Screen Landscape](https://drive.google.com/file/d/1PERCQSMuOl3WR_3WynGBiGL6N9xRNhHa/view?usp=sharing)

## **Challenges Faced During Development and How They Were Resolved**

### **1. Handling API Responses and Parsing JSON**
- **Challenge:** Parsing the JSON response from the OpenLibrary API to extract relevant book information.
- **Resolution:** Created a `Book` model class to map JSON data into Dart objects. The `BookProvider` class was used to fetch data from the API and return a list of `Book` objects.

### **2. Managing App State (Dark Mode & Font Size)**
- **Challenge:** Managing app state for features like dark mode and font size across multiple screens.
- **Resolution:** Used the `Provider` package for state management. Created a `ThemeProvider` class for dark mode and a state management solution for font size.

### **3. UI Layout and Responsiveness**
- **Challenge:** Ensuring the UI adapts well to different screen sizes and orientations.
- **Resolution:** Used Flutter’s layout widgets like `Expanded`, `Flexible`, and `ListView` for scrollable content. Ensured the layout works in both portrait and landscape modes.

### **4. Handling User Input and Search Functionality**
- **Challenge:** Handling empty search queries and managing API failures.
- **Resolution:** Implemented error handling and validation to manage empty search queries or failed API requests, displaying appropriate error messages to the user.

### **5. Language Translation and Multi-Language Support**
- **Challenge:** Implementing language selection functionality for multi-language support.
- **Resolution:** Created a helper method to handle language translations and allowed users to select a language from the settings screen.

## **Technologies Used**
- **Flutter:** Framework for building cross-platform mobile applications.
- **OpenLibrary API:** API for fetching book data.
- **Provider:** Package for state management (e.g., dark mode toggle, font size adjustment).
- **Material Design:** For building the app's user interface with standard components like `ListTile`, `BottomNavigationBar`, and `FloatingActionButton`.

## **Installation and Setup**

1. Clone the repository:

```
 git clone https://github.com/yourusername/book-explorer-app.git
```

2. Navigate to the project directory:

```
 cd book-explorer-app
```

3. Install dependencies:

```
flutter pub get
```

4. Run the application:

```
flutter run
```

## **Contributing**
I want to express my gratitude to the following for their invaluable contributions:
- The Dart and Flutter teams for providing robust tools and frameworks.
- My facilitator for teaching me flutter

## **License**
This project is licensed under the MIT License.
   
