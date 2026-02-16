import 'package:app_compat_benchmark_core/src/models/device_and_os/device_information.dart'
    as core;
import 'package:flutter_device_info_plus/flutter_device_info_plus.dart' as plug;

class DeviceInformationMapper {
  static core.DeviceInformation fromPlugin(plug.DeviceInformation pluginInfo) {
    return core.DeviceInformation(
      deviceName: pluginInfo.deviceName,
      manufacturer: pluginInfo.manufacturer,
      model: pluginInfo.model,
      brand: pluginInfo.brand,
      operatingSystem: pluginInfo.operatingSystem,
      systemVersion: pluginInfo.systemVersion,
      buildNumber: pluginInfo.buildNumber,
      cpuArchitecture: pluginInfo.processorInfo.architecture,
      cpuCores: pluginInfo.processorInfo.coreCount.toDouble(),
      cpuFrequencyMhz: pluginInfo.processorInfo.maxFrequency.toDouble(),
      totalRamMb: (pluginInfo.memoryInfo.totalPhysicalMemory ~/ (1024 * 1024))
          .toDouble(),
      availableRamMb:
          (pluginInfo.memoryInfo.availablePhysicalMemory ~/ (1024 * 1024))
              .toDouble(),
      totalMemoryMb: (pluginInfo.memoryInfo.totalStorageSpace ~/ (1024 * 1024))
          .toDouble(),
      availableMemoryMb:
          (pluginInfo.memoryInfo.availablePhysicalMemory ~/ (1024 * 1024))
              .toDouble(),
    );
  }
}
