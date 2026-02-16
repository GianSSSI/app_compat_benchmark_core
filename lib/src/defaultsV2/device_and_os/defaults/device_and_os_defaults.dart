import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/requirements/device_and_os_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/weights/device_and_os_weights_set.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

import 'package:app_compat_benchmark_core/src/models/shared/tiered_string_req.dart';

class DeviceAndOsDefaults
    implements DeviceAndOsRequirementsSet, DeviceAndOsWeightsSet {
  // requirements
  @override
  int get osVersion => 11;

  @override
  TieredStringReq get cpuArchitecture => const TieredStringReq(
    optimal: 'arm64',
    supported: 'arm64-v8a',
    limited: 'x86_64',
    minimum: 'armeabi-v7a',
  );

  @override
  TieredReq get cpuCores =>
      const TieredReq(optimal: 8, supported: 6, limited: 4);

  @override
  TieredReq get cpuFrequencyMHz =>
      const TieredReq(optimal: 2200, supported: 1800, limited: 1400);

  @override
  TieredReq get ramGB => const TieredReq(optimal: 4, supported: 3, limited: 2);

  @override
  TieredReq get storageGB =>
      const TieredReq(optimal: 32, supported: 16, limited: 8);

  @override
  TieredReq get thresholds =>
      const TieredReq(optimal: 80, supported: 60, limited: 40);

  // weights
  @override
  double get cpuSubArch => 0.60;

  @override
  double get cpuSubCore => 0.25;

  @override
  double get cpuSubFreq => 0.15;

  @override
  double get ramSub => 0.60;

  @override
  double get storageSub => 0.40;

  @override
  double get os => 0.35;

  @override
  double get ramStorage => 0.40;

  @override
  double get cpu => 0.25;
}
