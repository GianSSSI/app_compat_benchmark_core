import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/requirements/device_and_os_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/weights/device_and_os_weights_set.dart';
import 'package:app_compat_benchmark_core/src/models/device_and_os/device_and_os_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_string_req.dart';

class DeviceAndOsMerged
    implements DeviceAndOsRequirementsSet, DeviceAndOsWeightsSet {
  final DeviceAndOsRequirementsSet reqDefaults;
  final DeviceAndOsWeightsSet weightDefaults;
  final DeviceAndOsRemotePartial remote;

  DeviceAndOsMerged({
    required this.reqDefaults,
    required this.weightDefaults,
    required this.remote,
  });

  // requirements
  @override
  int get osVersion => remote.osVersion ?? reqDefaults.osVersion;

  @override
  TieredStringReq get cpuArchitecture =>
      remote.cpuArchitecture ?? reqDefaults.cpuArchitecture;

  @override
  TieredReq get cpuCores => remote.cpuCores ?? reqDefaults.cpuCores;

  @override
  TieredReq get cpuFrequencyMHz =>
      remote.cpuFrequencyMHz ?? reqDefaults.cpuFrequencyMHz;

  @override
  TieredReq get ramGB => remote.ramGB ?? reqDefaults.ramGB;

  @override
  TieredReq get storageGB => remote.storageGB ?? reqDefaults.storageGB;

  @override
  TieredReq get thresholds => remote.thresholds ?? reqDefaults.thresholds;

  // weights
  @override
  double get cpuSubArch => remote.cpuSubArch ?? weightDefaults.cpuSubArch;

  @override
  double get cpuSubCore => remote.cpuSubCore ?? weightDefaults.cpuSubCore;

  @override
  double get cpuSubFreq => remote.cpuSubFreq ?? weightDefaults.cpuSubFreq;

  @override
  double get ramSub => remote.ramSub ?? weightDefaults.ramSub;

  @override
  double get storageSub => remote.storageSub ?? weightDefaults.storageSub;

  @override
  double get os => remote.os ?? weightDefaults.os;

  @override
  double get ramStorage => remote.ramStorage ?? weightDefaults.ramStorage;

  @override
  double get cpu => remote.cpu ?? weightDefaults.cpu;
}
