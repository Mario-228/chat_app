import 'package:customer_service_realtime_chat/core/util/cache_helper/cache_constants.dart';
import 'package:customer_service_realtime_chat/features/login_view_feature/data/models/login_output_model.dart';
import 'package:hive_flutter/adapters.dart';

abstract class CacheHelper {
  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(CacheConstants.loginBox);
  }

  static Future<void> saveLoginData(LoginOutputModel model) async =>
      await _box.put(CacheConstants.userDataKey, model.toJson());

  static LoginOutputModel getLoginData() {
    final jsonData = _box.get(CacheConstants.userDataKey);
    if (jsonData != null && jsonData is Map) {
      return LoginOutputModel.fromJson(Map<String, dynamic>.from(jsonData));
    }
    return LoginOutputModel(
      id: "",
      displayName: "",
      email: "",
      emailConfirmed: "",
      phoneNumber: "",
      phoneNumberConfirmed: "",
      pictureUrl: "",
      gender: "",
      dBirth: "",
      token: "",
      refreshToken: "",
      refreshTokenExpiryTime: "",
      address: "",
    );
  }

  static Future<void> clearLoginData() async =>
      await _box.delete(CacheConstants.userDataKey);
}
