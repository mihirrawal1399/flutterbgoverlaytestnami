//verification cubit
import 'dart:async';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(const VerificationState());

  late CameraController cameraController;

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.low);
      await cameraController.initialize();
    } catch (e) {
      debugPrint('Error initializing camera: $e');
      // Handle initialization error
    }
  }

  Future<void> disposeCamera() async {
    await cameraController.dispose();
  }

  Future<void> takeSnapshot() async {
    try {
      final XFile imageFile = await cameraController.takePicture();
      final Uint8List imageData = await imageFile.readAsBytes();
      emit(state.copyWith(snapshot: imageData));
    } catch (e) {
      debugPrint('Error taking snapshot: $e');
      // Handle error taking snapshot
    }
  }

  Future<void> simulateLoading() async {
    int currentPercentage = 0;
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (currentPercentage >= 100) {
        timer.cancel();
        emit(state.copyWith(loadingPercentage: 100));
        takeSnapshot(); // Take snapshot when loading reaches 100%
      } else {
        emit(state.copyWith(loadingPercentage: currentPercentage));
        currentPercentage++;
      }
    });
    emit(state.copyWith(tryCount: state.tryCount + 1));
  }
}
