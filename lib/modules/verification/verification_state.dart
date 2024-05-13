// verification_state.dart
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

class VerificationState extends Equatable {
  final int loadingPercentage;
  final bool isLightError;
  final bool isVerified;
  final bool isSuccess;
  final int tryCount;
  final XFile? snapshot;

  const VerificationState({
    this.loadingPercentage = 0,
    this.isLightError = false,
    this.isVerified = false,
    this.isSuccess = false,
    this.tryCount = 0,
    this.snapshot,
  });

  VerificationState copyWith({
    int? loadingPercentage,
    bool? isLightError,
    bool? isVerified,
    int? tryCount,
    XFile? snapshot,
    bool? isSuccess,
  }) {
    return VerificationState(
      loadingPercentage: loadingPercentage ?? this.loadingPercentage,
      isLightError: isLightError ?? this.isLightError,
      isVerified: isVerified ?? this.isVerified,
      tryCount: tryCount ?? this.tryCount,
      snapshot: snapshot ?? this.snapshot,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
        loadingPercentage,
        isLightError,
        isVerified,
        tryCount,
        snapshot,
        isSuccess,
      ];
}
