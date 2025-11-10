import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/input_data_screen.dart';
import 'screens/diagnosis_screen.dart';
import 'screens/education_screen.dart';

// Warna global
final colors = {
  'primary': const Color(0xFF3B82F6),
  'background': const Color(0xFFF8FAFC),
  'white': Colors.white,
};

void main() {
  runApp(const SehatAnakApp());
}

class SehatAnakApp extends StatefulWidget {
  const SehatAnakApp({super.key});

  @override
  State<SehatAnakApp> createState() => _SehatAnakAppState();
}

class _SehatAnakAppState extends State<SehatAnakApp> {
  String currentScreen = 'splash';

  void navigateTo(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void onSubmitData(Map<String, dynamic> data) {
    // TODO: proses diagnosa atau simpan data
    navigateTo('diagnosis');
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (currentScreen) {
      case 'splash':
        screen = SplashScreen(onNavigate: navigateTo);
        break;
      case 'home':
        screen = HomeScreen(onNavigate: navigateTo);
        break;
      case 'input':
        screen = InputDataScreen(onNavigate: navigateTo, onSubmit: onSubmitData);
        break;
      case 'diagnosis':
        screen = DiagnosisScreen(onNavigate: navigateTo);
        break;
      case 'education':
        screen = EducationScreen(onNavigate: navigateTo);
        break;
      default:
        screen = SplashScreen(onNavigate: navigateTo);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sehat Anak',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: screen,
    );
  }
}
