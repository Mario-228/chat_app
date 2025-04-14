import 'package:customer_service_realtime_chat/features/reset_password_feature/data/models/reset_password_model.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/data/reset_password_repo/reset_password_repo_implementaion.dart';
import 'package:customer_service_realtime_chat/features/reset_password_feature/presentation/view_model/reset_password_cubit/reset_password_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordCubitStates> {
  ResetPasswordCubit() : super(ResetPasswordCubitInitial());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  Future<void> resetPasswordFunction({required String email}) async {
    emit(ResetPasswordStateLoading());
    var response = await ResetPasswordRepoImplementaion().resetPasswordByCode(
        model: ResetPasswordModel(
            email: email,
            code: codeController.text.trim(),
            password: passwordController.text.trim(),
            confirmPassword: passwordController.text.trim()));
    response.fold(
        (onError) => emit(ResetPasswordStateError(messaereError: onError)),
        (onSuccess) => emit(ResetPasswordStateSuccess()));
  }
}
