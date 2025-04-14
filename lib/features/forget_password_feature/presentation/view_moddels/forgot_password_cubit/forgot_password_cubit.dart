import 'package:customer_service_realtime_chat/features/forget_password_feature/data/forgot_password_repo/fotgot_password_repo_implementaion.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/view_moddels/forgot_password_cubit/forgot_password_cubit_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordCubitStates> {
  ForgotPasswordCubit() : super(ForgotPasswordCubitInitial());

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);
  final TextEditingController forgotPasswordEmailController =
      TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> forgetPasswodFunction() async {
    emit(ForgotPasswordCubitLoading());

    var response = await FotgotPasswordRepoImplementaion()
        .sendForgetPasswordRequest(
            email: forgotPasswordEmailController.text.trim());
    response.fold((onError) => emit(ForgotPasswordCubitError(error: onError)),
        (onSuccess) => emit(ForgotPasswordCubitSuccess()));
  }
}
