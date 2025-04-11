import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/api_services.dart';
import 'package:customer_service_realtime_chat/core/util/api_services/base_url.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/data/email_verification_repo/email_verification_end_points.dart';
import 'package:customer_service_realtime_chat/features/email_verification_feature/data/email_verification_repo/email_verification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EmailVerificationRepoImplementation implements EmailVerificationRepo {
  @override
  Future<Either<Errors, void>> resendOTP({required String email}) async {
    try {
      await ApiService(BaseUrl.api)
          .postOTP(EmailVerificationEndPoints.resendOTP, data: email);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Errors, void>> sendOTP({required String email}) async {
    try {
      await ApiService(BaseUrl.api)
          .get(EmailVerificationEndPoints.sendOTP, query: {"email": email});
      return const Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Errors, void>> verifyOTP({required String otp}) async {
    try {
      await ApiService(BaseUrl.api)
          .get("${EmailVerificationEndPoints.sendOTP}/$otp");
      return Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
