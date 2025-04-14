import 'package:customer_service_realtime_chat/features/submit_ticket_feature/presentation/view_model/ticket_form_cubit/ticket_form_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketFormCubit extends Cubit<TicketFormCubitStates> {
  TicketFormCubit() : super(TicketFormLoading());

  static TicketFormCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController chatTicketIdController = TextEditingController();
  final TextEditingController chatTopicController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  int dropDownValue = 4;

  void submitTicket() {
    emit(TicketFormLoading());
  }

  void changeDropDownValue(value) {
    dropDownValue = value!;
    emit(TicketFormChangeDropdownValue());
  }
}
