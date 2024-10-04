import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                SvgPicture.asset(
                  'assets/icon/food_mango.svg',
                  semanticsLabel: 'user Logo',
                  width: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hola, soy Rodrigo, estudiante de Ingeniería en desarrollo de videojuegos y realidad virtual, para esta ocasión tuve que hacer este codigo para dispositivos moviles.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back to Detail Page'),
            ),
          ),
        ],
      ),
    );
  }
}