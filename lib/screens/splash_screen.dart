import 'package:flutter/material.dart';
import '../main.dart';

class SplashScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const SplashScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      onNavigate('home');
    });

    return Scaffold(
      backgroundColor: colors['primary'],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.child_care, color: Colors.white, size: 100),
            SizedBox(height: 20),
            Text(
              "Sehat Anak",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
