import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static late AndroidDeviceInfo androidInfo;
  static init() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    androidInfo = await deviceInfo.androidInfo;
  }
}
