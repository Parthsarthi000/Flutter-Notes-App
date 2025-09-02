//import 'dart:io';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/foundation.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'app_body.dart';
import 'card.dart';
import 'bottom_bar.dart';
//import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const HomePage(title: "My Notes"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> categoryChips = ["All"];
  List<List<MyCard>> categoryCards = [
    []
  ]; // List of lists to store cards for each category
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    selectedCategory = 0;
  }

  void setCategory(int index) {
    setState(() {
      selectedCategory = index;
    });
  }

  void incrementCategories(String categoryName) {
    setState(() {
      categoryChips.add(categoryName);
      categoryCards.add([]); // Add a new list for the new category
    });
  }

  void deleteCard(int index) {
    setState(() {
      categoryCards[selectedCategory].removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
      ),
      bottomNavigationBar: MyBottomBar(
        categoryChips: categoryChips,
        setCategory: setCategory,
        selectedCategory: selectedCategory,
        incrementCategories: incrementCategories,
      ),
      body: MyBody(
        cards: categoryCards[selectedCategory],
        deleteCard: deleteCard,
        initialiseCard: (title, note, time) {
          setState(() {
            categoryCards[selectedCategory]
                .add(MyCard(title: title, note: note, time: time));
          });
        },
      ),
    );
  }
}
