import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verification',
          style: GoogleFonts.encodeSansExpanded(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Color(0xFF1A0A02),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This is Screen 2',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
