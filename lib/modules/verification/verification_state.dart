//verification states
import 'package:equatable/equatable.dart';

class NotificationsState extends Equatable {
  final int loadingPercentage;
  final bool isLightError;
  final bool isVerified;
  final int tryCount;

  const NotificationsState({
    this.loadingPercentage = 0,
    this.isLightError = false,
    this.isVerified = false,
    this.tryCount = 0,
  });

  NotificationsState copyWith({
    int? loadingPercentage,
    bool? isLightError,
    bool? isVerified,
    int? tryCount,
  }) {
    return NotificationsState(
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
