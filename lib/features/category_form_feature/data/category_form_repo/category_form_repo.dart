import 'package:customer_service_realtime_chat/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFormRepo {
  Future<Either<Errors, void>> logOut({required String token});
}
