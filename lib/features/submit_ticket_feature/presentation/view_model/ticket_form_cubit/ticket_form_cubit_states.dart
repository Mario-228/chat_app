class TicketFormCubitStates {}

class TicketFormSuccess extends TicketFormCubitStates {}

class TicketFormChangeDropdownValue extends TicketFormCubitStates {}

class TicketFormLoading extends TicketFormCubitStates {}

class TicketFormError extends TicketFormCubitStates {
  final String error;
  TicketFormError({required this.error});
}
