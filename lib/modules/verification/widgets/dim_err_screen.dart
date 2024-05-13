import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verification_cubit.dart';

class DimErrScreen extends StatelessWidget {
  const DimErrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingPercentage = context
        .select((VerificationCubit value) => value.state.loadingPercentage);
    return Column(
      children: [],
    );
  }
}
