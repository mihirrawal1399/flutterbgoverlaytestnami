import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verification_cubit.dart';

class Fail2Screen extends StatelessWidget {
  const Fail2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final snapshot =
        context.select((VerificationCubit value) => value.state.snapshot);
    return Column(
      children: [
        const SizedBox(height: 48),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: snapshot?.path != null
                ? DecorationImage(
                    image: FileImage(File(snapshot!.path)),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          height: MediaQuery.of(context).size.height * 0.44,
          width: MediaQuery.of(context).size.width * 0.78,
          child: snapshot?.path == null
              ? const Center(
                  child: Text('Captured image issue'),
                )
              : null,
        ),
        const SizedBox(height: 48),
        Text(
          'We couldnt recognize your face',
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Color(0xFF1A0A02),
            ),
          ),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Don’t Worry, your request for Attendance has been sent to the Head for approval!',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                color: Color(0xFF1A0A02),
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Go to Dashboard and continue with your tasks for the day once your attendance is approved.',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.0,
                color: Color(0xFF1A0A02),
              ),
            ),
          ),
        ),
        const Spacer(),
        const Divider(
          color: Color(0xFFB8B8B8),
          thickness: 1.5,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: const Color(0xFF5F69C7),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            child: Text(
              'Go to Dashboard',
              style: GoogleFonts.encodeSansExpanded(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
