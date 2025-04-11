import 'package:customer_service_realtime_chat/features/register_view_feature/data/models/register_input_model.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/data/register_repo/register_repo_implementations.dart';
import 'package:customer_service_realtime_chat/features/register_view_feature/presentation/views_models/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Future<void> register(RegisterInputModel model) async {
    emit(RegisterLoading());
    var response = await RegisterRepoImplementations()
        .registerUser(registerInputModel: model);
    response.fold(
      (onError) => emit(RegisterError(message: onError.errorMessage)),
      (onSuccess) => emit(RegisterSuccess()),
    );
  }
}
