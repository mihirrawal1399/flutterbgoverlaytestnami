import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verification_cubit.dart';

class Fail1Screen extends StatelessWidget {
  const Fail1Screen({super.key});

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
        ElevatedButton(
          onPressed: () {
            context.read<VerificationCubit>().simulateLoading();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(
                color: Color(0xFF5F69C7),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.width * 0.4,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.replay,
                  color: Color(0xFF5F69C7),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Re-Take',
                  style: GoogleFonts.encodeSansExpanded(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFF5F69C7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        const Divider(
          color: Color(0xFFB8B8B8),
          thickness: 1.5,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: const Color(0xFFBFBFBF),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            child: Text(
              'Verify',
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
