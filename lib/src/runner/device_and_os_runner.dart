import 'package:app_compat_benchmark_core/src/helpers/device_info_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_info_plus/flutter_device_info_plus.dart';
import 'package:app_compat_benchmark_core/src/models/device_and_os/device_information.dart'
    as core;

class DeviceAndOsRunner {
  final FlutterDeviceInfoPlus _plugin = FlutterDeviceInfoPlus();

  Future<core.DeviceInformation> getDeviceInformation() async {
    final pluginInfo = await _plugin.getDeviceInfo();
    debugPrint("DeviceAndOsRunner pluginInfo $pluginInfo");
    return DeviceInformationMapper.fromPlugin(pluginInfo);
  }
}
