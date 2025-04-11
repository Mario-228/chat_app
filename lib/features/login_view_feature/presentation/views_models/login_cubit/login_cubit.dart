import 'package:customer_service_realtime_chat/features/login_view_feature/data/login_repo/login_repo_implementation.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_input_model.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/presentation/views_models/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> login(LoginInputModel model) async {
    var response =
        await LoginRepoImplementation().loginUser(loginInputModel: model);
    response.fold(
      (onError) => emit(LoginError(errorMessage: onError.errorMessage)),
      (onSuccess) => emit(LoginSuccess()),
    );
  }
}
