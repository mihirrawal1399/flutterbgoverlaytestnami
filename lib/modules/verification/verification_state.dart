//verification states
import 'package:equatable/equatable.dart';

class VerificationState extends Equatable {
  final int loadingPercentage;
  final bool isLightError;
  final bool isVerified;
  final int tryCount;

  const VerificationState({
    this.loadingPercentage = 0,
    this.isLightError = false,
    this.isVerified = false,
    this.tryCount = 0,
  });

  VerificationState copyWith({
    int? loadingPercentage,
    bool? isLightError,
    bool? isVerified,
    int? tryCount,
  }) {
    return VerificationState(
      loadingPercentage: loadingPercentage ?? this.loadingPercentage,
      isLightError: isLightError ?? this.isLightError,
      isVerified: isVerified ?? this.isVerified,
      tryCount: tryCount ?? this.tryCount,
    );
  }

  @override
  List<Object?> get props => [
        loadingPercentage,
        isLightError,
        isVerified,
        tryCount,
      ];
}
