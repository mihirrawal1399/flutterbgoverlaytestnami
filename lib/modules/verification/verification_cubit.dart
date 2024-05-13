//verification cubit
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'verification_state.dart'; // Import your VerificationState model

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(const VerificationState());

  Future<void> simulateLoading() async {
    int currentPercentage = 0;
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (currentPercentage >= 100) {
        timer.cancel();
        emit(state.copyWith(loadingPercentage: 100));
      } else {
        emit(state.copyWith(loadingPercentage: currentPercentage));
        currentPercentage++;
      }
    });
  }
}
