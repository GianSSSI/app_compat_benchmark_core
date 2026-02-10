import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

abstract class DeviceAndOsWeightsSet {
  //CPU Sub Scores
  DefaultValue get cpuSubArch;
  DefaultValue get cpuSubCore;
  DefaultValue get cpuSubFreq;
  //RAM&Storage Sub Scores
  DefaultValue get ramSub;
  DefaultValue get storageSub;
  //Device and OS Scores
  DefaultValue get os;
  DefaultValue get ramStorage;
  DefaultValue get cpu;
}
