import 'package:app_compat_benchmark_core/src/defaults/device_and_os/weights/device_and_os_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/weights/device_os_weights_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsWeightsDefaultBundle extends DefaultValue
    implements DeviceAndOsWeightsSet {
  const DeviceAndOsWeightsDefaultBundle._() : super(key: 'default', value: 0);

  static const defaults = DeviceAndOsWeightsDefaultBundle._();

  // ---------- CPU ----------
  @override
  DefaultValue get cpu => DeviceAndOsWeightsDefault.cpu;

  @override
  DefaultValue get cpuSubArch => DeviceAndOsWeightsDefault.cpuSubArch;

  @override
  DefaultValue get cpuSubCore => DeviceAndOsWeightsDefault.cpuSubCore;

  @override
  DefaultValue get cpuSubFreq => DeviceAndOsWeightsDefault.cpuSubFreq;

  // ---------- OS ----------
  @override
  DefaultValue get os => DeviceAndOsWeightsDefault.os;

  // ---------- RAM ----------
  @override
  DefaultValue get ramStorage => DeviceAndOsWeightsDefault.ramStorage;

  @override
  DefaultValue get ramSub => DeviceAndOsWeightsDefault.ramSub;

  // ---------- STORAGE ----------
  @override
  DefaultValue get storageSub => DeviceAndOsWeightsDefault.storageSub;
}
