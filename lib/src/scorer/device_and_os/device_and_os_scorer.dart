import 'package:app_compat_benchmark_core/src/defaults/device_and_os/requirements/device_and_os_requirements_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/requirements/device_and_os_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/score/device_and_os_scores_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/score/device_and_os_scores_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/weights/device_and_os_weights_defaults_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/weights/device_and_os_weights_set.dart';
import 'package:flutter/material.dart';

class DeviceAndOsScorer {
  final DeviceAndOsRequirementsSet? deviceAndOsRequirementsSet;
  final DeviceAndOsScoresSet? deviceAndOsScoresSet;
  final DeviceAndOsWeightsSet? deviceAndOsWeightsSet;

  DeviceAndOsScorer({
    this.deviceAndOsRequirementsSet,
    this.deviceAndOsScoresSet,
    this.deviceAndOsWeightsSet,
  });

  DeviceAndOsRequirementsSet get _requirements =>
      deviceAndOsRequirementsSet ??
      DeviceAndOsRequirementsDefaultBundle.defaults;

  DeviceAndOsScoresSet get _scores =>
      deviceAndOsScoresSet ?? DeviceAndOsScoresDefaultBundle.defaults;

  DeviceAndOsWeightsSet get _weights =>
      deviceAndOsWeightsSet ?? DeviceAndOsWeightsDefaultBundle.defaults;

  double scoreOSVersion({required double osVersion}) {
    debugPrint(' BNCH weights types: os=${_weights.os.value.runtimeType}, ');
    if (osVersion < _requirements.osVersion.value) {
      return _scores.incompatible.value;
    }
    return _scores.osVersionCompatible.value;
  }

  double scoreCpuArchitecture({required String arch}) {
    debugPrint(
      ' BNCH weights types: cpu arch=${_weights.cpuSubArch.value.runtimeType}, ',
    );
    if (arch == _requirements.archOptimalReq.value) {
      return _scores.dosOptimal.value;
    }
    if (arch == _requirements.archSupportedReq.value) {
      return _scores.dosSupported.value;
    }
    if (arch == _requirements.archLimitedReq.value) {
      return _scores.dosLimited.value;
    }
    if (arch == _requirements.archMinimumReq.value) {
      return _scores.dosMinimum.value;
    }
    return _scores.incompatible.value;
  }

  double scoreCpuCores({required int cores}) {
    debugPrint(
      ' BNCH weights types: cpu cores =${_weights.cpuSubCore.value.runtimeType}, ',
    );
    if (cores >= _requirements.coreOptimalReq.value) {
      return _scores.coreOptimal.value;
    }
    if (cores >= _requirements.coreSupportedReq.value) {
      return _scores.coreSupported.value;
    }
    if (cores >= _requirements.coreLimitedReq.value) {
      return _scores.coreLimited.value;
    }
    return _scores.coreMinimum.value;
  }

  double scoreCpuFrequency(int mhz) {
    debugPrint(
      ' BNCH weights types: CPU freq =${_weights.cpuSubFreq.value.runtimeType}, ',
    );
    if (mhz >= _requirements.freqOptimalReq.value) {
      return _scores.freqOptimal.value;
    }
    if (mhz >= _requirements.freqSupportedReq.value) {
      return _scores.freqSupported.value;
    }
    if (mhz >= _requirements.freqLimitedReq.value) {
      return _scores.freqLimited.value;
    }
    return _scores.freqMinimum.value;
  }

  double scoreAvailableRamGb(double ramGb) {
    debugPrint(
      ' BNCH weights types: ramSubStorage=${_weights.ramSub.value.runtimeType}, ',
    );
    if (ramGb >= _requirements.ramOptimalReq.value) {
      return _scores.ramOptimal.value;
    }
    if (ramGb >= _requirements.ramSupportedReq.value) {
      return _scores.ramSupported.value;
    }
    if (ramGb >= _requirements.ramLimitedReq.value) {
      return _scores.ramLimited.value;
    }
    return _scores.ramMinimum.value;
  }

  double scoreAvailableStorageGb(double storageGb) {
    debugPrint(
      ' BNCH weights types: storage=${_weights.storageSub.value.runtimeType}, ',
    );
    if (storageGb >= _requirements.strgOptimalReq.value) {
      return _scores.strgOptimal.value;
    }
    if (storageGb >= _requirements.strgSupportedReq.value) {
      return _scores.strgSupported.value;
    }
    if (storageGb >= _requirements.strgLimitedReq.value) {
      return _scores.strgLimited.value;
    }
    return _scores.strgMinimum.value;
  }

  double calculateRamStorageScore({
    required double ram,
    required double storage,
  }) {
    debugPrint(
      ' BNCH weights types: ramStorage=${_weights.ramStorage.value.runtimeType}, ',
    );
    return ram * _weights.ramSub.value + storage * _weights.storageSub.value;
  }

  double calculateCpuScore({
    required double arch,
    required double cores,
    required double freq,
  }) {
    debugPrint(' BNCH weights types: os=${_weights.cpu.value.runtimeType}, ');
    return arch * _weights.cpuSubArch.value +
        cores * _weights.cpuSubCore.value +
        freq * _weights.cpuSubFreq.value;
  }

  double calculateDeviceAndOSScore({
    required double os,
    required double ramStorage,
    required double cpu,
  }) {
    debugPrint(
      ' BNCH weights types: os=${_weights.os.value.runtimeType}, '
      'ramStorage=${_weights.ramStorage.value.runtimeType}, '
      'cpu=${_weights.cpu.value.runtimeType}',
    );
    return os * _weights.os.value +
        ramStorage * _weights.ramStorage.value +
        cpu * _weights.cpu.value;
  }
}
