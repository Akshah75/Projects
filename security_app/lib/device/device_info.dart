import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

//
class DeviceInfoApi {
  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String?> getOperatingSystem() async {
    Platform.operatingSystem;
  }

  static Future<String?> getPhoneInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return '${info.manufacturer} - ${info.model}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return '${info.name} - ${info.model}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String?> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return info.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemVersion;
    } else {
      throw UnimplementedError();
    }
  }
}
