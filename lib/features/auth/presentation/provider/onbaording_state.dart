import 'package:glypha/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onbaording_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currentStep,
    @Default('') String phoneNumber,
    @Default('') String educationLevel,
    @Default([]) List<String> interests,
    @Default(false) bool isLoading,
    AuthFailure? error,
  }) = _OnboardingState;
}