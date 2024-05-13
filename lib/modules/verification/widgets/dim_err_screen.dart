import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verification_cubit.dart';

class DimErrScreen extends StatelessWidget {
  const DimErrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final snapshot =
        context.select((VerificationCubit value) => value.state.snapshot);
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        snapshot?.path != null
            ? Image.file(
                File(snapshot!.path),
                fit: BoxFit.cover,
              )
            : const Center(child: CircularProgressIndicator()),
        Positioned(
          top: 32,
          child: Text(
            'Please look into the camera and hold still',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                color: Color(0xFF1A0A02),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          child: const Icon(
            Icons.light_mode,
            color: Colors.white,
            size: 32,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          child: Row(
            children: [
              const Icon(
                Icons.replay,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                'Lighting is less, Try Again',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 48,
          child: ElevatedButton(
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
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.replay,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Re-Take',
                    style: GoogleFonts.encodeSansExpanded(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
