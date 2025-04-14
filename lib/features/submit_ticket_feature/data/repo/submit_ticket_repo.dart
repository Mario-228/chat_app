import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/features/submit_ticket_feature/data/model/tocket_form_model.dart';
import 'package:dartz/dartz.dart';

abstract class SubmitTicketRepo {
  Future<Either<Errors, void>> submitTicket(
      {required TicketFormModel tocketFormModel});
}
