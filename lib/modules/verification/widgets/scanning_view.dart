import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../verification_cubit.dart';

class ScanningView extends StatefulWidget {
  const ScanningView({super.key});

  @override
  State<ScanningView> createState() => _ScanningViewState();
}

class _ScanningViewState extends State<ScanningView> {
  late VerificationCubit _verificationCubit;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _verificationCubit = context.read<VerificationCubit>();
    _verificationCubit.initializeCamera();
    _cameraController = _verificationCubit.cameraController;
  }

  @override
  void dispose() {
    _verificationCubit.disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loadingPercentage = context
        .select((VerificationCubit value) => value.state.loadingPercentage);
    return Column(
      children: [
        if (_cameraController.value.isInitialized) ...[
          Expanded(
            child: CameraPreview(
              _cameraController,
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'Please look into the camera and hold still',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Color(0xFF1A0A02),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Image.asset(
                    'assets/verify2.png',
                    // height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  const Spacer(),
                  const Spacer(),
                  Text(
                    '$loadingPercentage% Scanning',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                        color: Color(0xFF1A0A02),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: LinearProgressIndicator(
                      color: const Color(0xFF5F69C7),
                      value: loadingPercentage.toDouble() / 100,
                      borderRadius: BorderRadius.circular(10),
                      minHeight: 10,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ] else ...[
          const Center(child: CircularProgressIndicator()),
        ]
      ],
    );
  }
}
