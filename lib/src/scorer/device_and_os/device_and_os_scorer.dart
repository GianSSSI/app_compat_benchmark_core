import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/defaults/device_and_os_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/requirements/device_and_os_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/scores/device_and_os_scores_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/scores/device_and_os_scores_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/weights/device_and_os_weights_set.dart';

class DeviceAndOsScorer {
  // NEW config sets (nullable for fallback)
  final DeviceAndOsRequirementsSet? deviceAndOsRequirementsSet;
  final DeviceAndOsWeightsSet? deviceAndOsWeightsSet;

  // KEEP score rubric app-only
  final DeviceAndOsScoresSet? deviceAndOsScoresSet;

  DeviceAndOsScorer({
    this.deviceAndOsRequirementsSet,
    this.deviceAndOsWeightsSet,
    this.deviceAndOsScoresSet,
  });

  // NEW defaults (from the new system)
  DeviceAndOsRequirementsSet get _requirements =>
      deviceAndOsRequirementsSet ?? DeviceAndOsDefaults();

  DeviceAndOsWeightsSet get _weights =>
      deviceAndOsWeightsSet ?? DeviceAndOsDefaults();

  // OLD score rubric default (keep)
  DeviceAndOsScoresSet get _scores =>
      deviceAndOsScoresSet ?? DeviceAndOsScoresDefaultBundle.defaults;

  double scoreOSVersion({required double osVersion}) {
    // requirements.osVersion is int now
    if (osVersion < _requirements.osVersion.toDouble()) {
      return _scores.incompatible.value;
    }
    return _scores.osVersionCompatible.value;
  }

  double scoreCpuArchitecture({required String arch}) {
    final a = _requirements.cpuArchitecture; // TieredStringReq

    if (arch == a.optimal) return _scores.dosOptimal.value;
    if (arch == a.supported) return _scores.dosSupported.value;
    if (arch == a.limited) return _scores.dosLimited.value;
    if (arch == a.minimum) return _scores.dosMinimum.value;

    return _scores.incompatible.value;
  }

  double scoreCpuCores({required int cores}) {
    final r = _requirements.cpuCores; // TieredReq

    if (cores >= r.optimal) return _scores.coreOptimal.value;
    if (cores >= r.supported) return _scores.coreSupported.value;
    if (cores >= r.limited) return _scores.coreLimited.value;

    return _scores.coreMinimum.value;
  }

  double scoreCpuFrequency({required int mhz}) {
    final r = _requirements.cpuFrequencyMHz; // TieredReq

    if (mhz >= r.optimal) return _scores.freqOptimal.value;
    if (mhz >= r.supported) return _scores.freqSupported.value;
    if (mhz >= r.limited) return _scores.freqLimited.value;

    return _scores.freqMinimum.value;
  }

  double scoreAvailableRamGb({required double ramGb}) {
    final r = _requirements.ramGB; // TieredReq

    if (ramGb >= r.optimal) return _scores.ramOptimal.value;
    if (ramGb >= r.supported) return _scores.ramSupported.value;
    if (ramGb >= r.limited) return _scores.ramLimited.value;

    return _scores.ramMinimum.value;
  }

  double scoreAvailableStorageGb({required double storageGb}) {
    final r = _requirements.storageGB; // TieredReq

    if (storageGb >= r.optimal) return _scores.strgOptimal.value;
    if (storageGb >= r.supported) return _scores.strgSupported.value;
    if (storageGb >= r.limited) return _scores.strgLimited.value;

    return _scores.strgMinimum.value;
  }

  double calculateRamStorageScore({
    required double ram,
    required double storage,
  }) {
    // weights are doubles now
    return ram * _weights.ramSub + storage * _weights.storageSub;
  }

  double calculateCpuScore({
    required double arch,
    required double cores,
    required double freq,
  }) {
    return arch * _weights.cpuSubArch +
        cores * _weights.cpuSubCore +
        freq * _weights.cpuSubFreq;
  }

  double calculateDeviceAndOSScore({
    required double os,
    required double ramStorage,
    required double cpu,
  }) {
    return os * _weights.os +
        ramStorage * _weights.ramStorage +
        cpu * _weights.cpu;
  }
}
