import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsWeightsDefault {
  //CPU Sub Scores
  static const cpuSubArch = DefaultValue(key: 'cpuSubArch', value: 0.6);
  static const cpuSubCore = DefaultValue(key: 'cpuSubCore', value: 0.25);
  static const cpuSubFreq = DefaultValue(key: 'cpuSubFreq', value: 0.15);

  //RAM&Storage Sub Scores
  static const ramSub = DefaultValue(key: "ramSub", value: 0.6);
  static const storageSub = DefaultValue(key: "storageSub", value: 0.4);

  //Device and OS Scores
  static const os = DefaultValue(key: "os", value: 0.35);
  static const ramStorage = DefaultValue(key: "ramStorage", value: 0.40);
  static const cpu = DefaultValue(key: "cpu", value: 0.25);
}
