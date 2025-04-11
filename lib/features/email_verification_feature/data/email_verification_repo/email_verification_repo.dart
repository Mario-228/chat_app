import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class EmailVerificationRepo {
  Future<Either<Errors, void>> sendOTP({required String email});
  Future<Either<Errors, void>> resendOTP({required String email});
  Future<Either<Errors, void>> verifyOTP({required String otp});
}
