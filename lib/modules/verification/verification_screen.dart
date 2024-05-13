import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbgoverlaytestnami/modules/verification/widgets/first_time_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'verification_cubit.dart';
import 'widgets/scanning_view.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: Scaffold(
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
        body: const VerificationBody(),
      ),
    );
  }
}

class VerificationBody extends StatelessWidget {
  const VerificationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loadingPercentage = context
        .select((VerificationCubit value) => value.state.loadingPercentage);
    final tryCount =
        context.select((VerificationCubit value) => value.state.tryCount);
    return SizedBox(
      width: double.maxFinite,
      child: (tryCount == 0 &&
              (loadingPercentage == 0 || loadingPercentage == 100))
          ? const FirstTimeView()
          : (loadingPercentage > 0 || loadingPercentage < 100) 
          ? const ScanningView()
           :const SizedBox.square(),
    );
  }
}
