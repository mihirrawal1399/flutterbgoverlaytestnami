import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verification_cubit.dart';

class Fail1Screen extends StatelessWidget {
  const Fail1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingPercentage = context
        .select((VerificationCubit value) => value.state.loadingPercentage);
    final snapshot =
        context.select((VerificationCubit value) => value.state.snapshot);
    return Column(
      children: [
        const SizedBox(height: 32),
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
        )
      ],
    );
  }
}
