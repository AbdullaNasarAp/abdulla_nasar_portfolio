import 'package:abdulla_nasar_portfolio/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true,
      builder: (p0) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: "Kanit",
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

List<String> socialMedia = [
  "assets/image/instagram.svg",
  "assets/image/linkedin.svg",
  "assets/image/GitHub.svg",
];
List<String> familiar1 = [
  "assets/image/icons8-flutter-48.png",
  "assets/image/icons8-dart-48.png",
  "assets/image/icons8-graphql-48.png",
  // "assets/image/icons8-firebase-48.png",
];
List<String> familiar2 = [
  "assets/image/icons8-java-94.png",
  "assets/image/icons8-html-48.png",
  "assets/image/icons8-css-48.png",
  // "assets/image/icons8-git-48.png",
];
List<String> familiar3 = [
  "assets/image/icons8-figma-48.png",
  "assets/image/icons8-mongodb-48.png",
  "assets/image/icons8-postman-is-the-only-complete-api-development-environment-24.png",
  // "assets/image/hasura-primary.png",
];
List<String> familiar4 = [
  "assets/image/icons8-vs-code-48.png",
  "assets/image/icons8-android-studio-48.png",
];

final List<String> messages = [
  "Hello, I'm Abdulla Nasar",
  'नमस्ते, मैं अब्दुल्ला नासर हूँ',
  'مرحبا، أنا عبد الله نصار',
  'ഹലോ, ഞാൻ അബ്ദുല്ല നാസർ',
  'Hallo, Ich bin Abdulla Nasar',
  'Bonjour, Je suis Abdulla Nasar',
  'Hola, Soy Abdulla Nasar',
];
