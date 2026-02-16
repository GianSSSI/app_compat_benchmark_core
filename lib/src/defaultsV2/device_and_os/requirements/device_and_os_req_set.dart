import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_string_req.dart';

abstract class DeviceAndOsRequirementsSet {
  int get osVersion;

  TieredStringReq get cpuArchitecture;
  TieredReq get cpuCores;
  TieredReq get cpuFrequencyMHz;

  TieredReq get ramGB;
  TieredReq get storageGB;

  TieredReq get thresholds;
}
