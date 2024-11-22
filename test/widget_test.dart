import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:book_explorer/main.dart';

void main() {
  group('Book Explorer App Tests', () {
    testWidgets('Home page loads correctly with images and title',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Check for the home screen title
      expect(find.text('Welcome to Book Explorer!'), findsOneWidget);

      // Check if images are present
      expect(find.byType(Image), findsNWidgets(4));
    });

    testWidgets('Navigation bar switches between screens',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Check initial screen is HomeScreen
      expect(find.text('Welcome to Book Explorer!'), findsOneWidget);

      // Tap on "Search" tab
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Check if it navigated to SearchResultsScreen
      expect(find.byType(SearchResultsScreen), findsOneWidget);

      // Tap on "Details" tab
      await tester.tap(find.byIcon(Icons.info));
      await tester.pumpAndSettle();

      // Check if it navigated to BookDetailsScreen
      expect(find.byType(BookDetailsScreen), findsOneWidget);

      // Return to Home tab
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      // Ensure back to HomeScreen
      expect(find.text('Welcome to Book Explorer!'), findsOneWidget);
    });

    testWidgets('Search results screen displays books',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Navigate to SearchResultsScreen
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Check if book titles are displayed
      expect(find.text('Book Title 1'), findsOneWidget);
      expect(find.text('Book Title 2'), findsOneWidget);

      // Check if the correct number of book cards are displayed
      expect(find.byType(Card), findsNWidgets(2));
    });

    testWidgets('Book details screen displays sample book',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Navigate to BookDetailsScreen
      await tester.tap(find.byIcon(Icons.info));
      await tester.pumpAndSettle();

      // Check if book details are displayed
      expect(find.text('Sample Book'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.textContaining('description of the book'), findsOneWidget);

      // Check if the "Read More" button is present
      expect(find.text('Read More'), findsOneWidget);
    });

    testWidgets('Clickable links exist in search results',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Navigate to SearchResultsScreen
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Check for clickable icons (links)
      expect(find.byIcon(Icons.open_in_new), findsNWidgets(2));
    });
  });
}

class BookDetailsScreen {}

class SearchResultsScreen {}
