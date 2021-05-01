part of '../services.dart';

class JoinEventServicesApi {
  static Future<ApiReturnValue<List<JoinEvent>>> getJoin() async {
    await Future.delayed(
      Duration(milliseconds: 800),
    );
    return ApiReturnValue(value: mockJointEvent);
  }
}
