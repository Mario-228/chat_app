import 'package:customer_service_realtime_chat/features/email_verification_feature/data/email_verification_repo/email_verification_repo_implementation.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/presentation/views_models/verification_cubit/verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCubit extends Cubit<VerificationStates> {
  VerificationCubit() : super(VerificationInitial());

  static VerificationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> sendVerification({required String email}) async {
    emit(SendVerificationLoading());
    var response =
        await EmailVerificationRepoImplementation().sendOTP(email: email);
    response.fold(
      (onError) => emit(SendVerificationError(error: onError.errorMessage)),
      (onSuccess) => emit(SendVerificationSuccess()),
    );
  }

  Future<void> resendVerification({required String email}) async {
    emit(ReSendVerificationLoading());
    var response =
        await EmailVerificationRepoImplementation().resendOTP(email: email);
    response.fold(
      (onError) => emit(ReSendVerificationError(error: onError.errorMessage)),
      (onSuccess) => emit(ReSendVerificationSuccess()),
    );
  }

  Future<void> verifyVerification({required String otp}) async {
    emit(VerificationLoading());
    var response =
        await EmailVerificationRepoImplementation().verifyOTP(otp: otp);
    response.fold(
      (onError) => emit(VerificationError(error: onError.errorMessage)),
      (onSuccess) => emit(VerificationSuccess()),
    );
  }
}
