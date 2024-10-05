
import 'package:employee_manager/constant.dart';
import 'package:flutter/services.dart';

class ConnectionManager{
  // 'data': data,
  // 'operation': operation,
  // 'index': index,
  // 'employeeItem': employeeItem,
  static Future<Map<String, dynamic>?> connectWithAndroid(Map<String, dynamic> data) async {
    Map<dynamic, dynamic> result = {};
    try {
      result =  await MethodChannel(Constant.platform).invokeMethod('employee_details', {
        'data': data,
      });

    } on PlatformException catch (e) {
      print("Failed to connect with Android: '${e.message}'.");
    }
    return Map<String, dynamic>.from(result);
  }
}