import 'package:customer_service_realtime_chat/features/chat_feature/presentation/views_models/chatting_cubit/chatting_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChattingCubit extends Cubit<ChattingStates> {
  ChattingCubit() : super(ChattingInitial());

  static ChattingCubit get(BuildContext context) => BlocProvider.of(context);
}
