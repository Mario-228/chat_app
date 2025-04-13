import 'package:customer_service_realtime_chat/features/forget_password_feature/data/forgot_password_repo/fotgot_password_repo_implementaion.dart';
import 'package:customer_service_realtime_chat/features/forget_password_feature/presentation/view_moddels/forgot_password_cubit/forgot_password_cubit_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordCubitStates> {
  ForgotPasswordCubit() : super(ForgotPasswordCubitInitial());

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);
  final TextEditingController forgotPasswordEmaildController =
      TextEditingController();
  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();
  final TextEditingController forgotPasswordPasswordController =
      TextEditingController();
  final TextEditingController orgotPasswordCodeController =
      TextEditingController();

  Future<void> ForgetPasswodFunction(String email) async {
    emit(ForgotPasswordCubitAwaiting());

    var response = await FotgotPasswordRepoImplementaion()
        .SendForgetPasswordRequest(email: email);
    response.fold((onError) => emit(ForgotPasswordCubitError(error: onError)),
        (onSuccess) => emit(ForgotPasswordCubitSuccess()));
  }
}
