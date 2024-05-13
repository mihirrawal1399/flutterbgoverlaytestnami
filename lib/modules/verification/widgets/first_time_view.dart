import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verification_cubit.dart';

class FirstTimeView extends StatelessWidget {
  const FirstTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,P
      children: [
        const Spacer(),
        Image.asset(
          'assets/verify1.png',
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
          child: Text(
            'Initiate face verification for quick attendance Process.',
            textAlign: TextAlign.center,
            style: GoogleFonts.encodeSansExpanded(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Color(0xFF1A0A02),
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          'Privacy Notice',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              decoration: TextDecoration.underline,
              color: Color(0xFF5F69C7),
            ),
          ),
        ),
        const Divider(
          color: Color(0xFFB8B8B8),
          thickness: 1.5,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<VerificationCubit>().simulateLoading();
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
