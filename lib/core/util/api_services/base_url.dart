import 'package:dio/dio.dart';

abstract class BaseUrl {
  static final Dio authentication = Dio(
    BaseOptions(
      baseUrl: "https://rational-deep-dinosaur.ngrok-free.app/api/",
      receiveDataWhenStatusError: true,
    ),
  );
}
