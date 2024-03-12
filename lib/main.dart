import 'package:flutter/material.dart';
import 'package:githubsearch/screens/home_screen.dart'; // Ubah 'your_app' sesuai dengan nama paket aplikasi Anda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GithubSearch', // Ubah dengan judul aplikasi Anda
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
