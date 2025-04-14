import 'package:customer_service_realtime_chat/features/category_form_feature/data/category_form_repo/category_form_repo_implementation.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views_models/logout_cubit/logout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutInitial());

  static LogoutCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> logOut({required String token}) async {
    emit(LogoutLoading());
    var response = await CategoryFormRepoImplementation().logOut(token: token);
    response.fold(
      (onLeft) => emit(LogoutError(error: onLeft.errorMessage)),
      (onSuccess) => emit(LogoutSuccess()),
    );
  }
}
