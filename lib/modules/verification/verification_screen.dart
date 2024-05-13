import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbgoverlaytestnami/modules/verification/widgets/fail1_screen.dart';
import 'package:flutterbgoverlaytestnami/modules/verification/widgets/first_time_view.dart';
import 'package:flutterbgoverlaytestnami/modules/verification/widgets/success_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'verification_cubit.dart';
import 'widgets/dim_err_screen.dart';
import 'widgets/fail2_screen.dart';
import 'widgets/scanning_view.dart';

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
      body: const VerificationBody(),
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
    final isSuccess =
        context.select((VerificationCubit value) => value.state.isSuccess);
    final isScanning = loadingPercentage > 0 && loadingPercentage < 100;
    final tryCount =
        context.select((VerificationCubit value) => value.state.tryCount);
    // debugPrint(':::::::::::::::::::::::::::::::');
    // debugPrint(':::LOADING PERCENTAGE:::  $loadingPercentage');
    // debugPrint(':::ISSCANNING:::  $isScanning');
    // debugPrint(':::TRYCOUNT:::  $tryCount');
    // debugPrint(':::ISSUCCESS:::  $isSuccess');
    // debugPrint(':::::::::::::::::::::::::::::::');
    return SizedBox(
      width: double.maxFinite,
      child: isScanning
          ? const ScanningView()
          : tryCount == 0
              ? const FirstTimeView()
              : isSuccess
                  ? const SuccessScreen()
                  : tryCount == 1
                      ? const DimErrScreen()
                      : tryCount == 2
                          ? const Fail1Screen()
                          : const Fail2Screen(),
    );
  }
}
