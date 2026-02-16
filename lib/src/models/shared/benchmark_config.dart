import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/defaults/device_and_os_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/requirements/device_and_os_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/weights/device_and_os_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/domain/defaults/domain_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/domain/score/main_somain_score_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/defaults/feature_support_default.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/requirements/feature_supp_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/weights/feature_supp_weight_set.dart';

import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/defaults/performance_default.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/requirements/performance_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/weights/performance_weights_set.dart';

import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';
import 'package:app_compat_benchmark_core/src/models/device_and_os/device_and_os_merged.dart';
import 'package:app_compat_benchmark_core/src/models/device_and_os/device_and_os_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/domain/domain_merged.dart';
import 'package:app_compat_benchmark_core/src/models/domain/domain_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_merged.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/performance/performance_merged.dart';
import 'package:app_compat_benchmark_core/src/models/performance/performance_remote_partials.dart';

class BenchmarkConfig {
  final DeviceAndOsMerged deviceAndOs; // implements requirements + weights
  final PerformanceMerged performance; // implements requirements + weights
  final FeatureSupportMerged
  featureSupport; // implements requirements + weights
  final MainDomainScoresMerged mainDomainScores;

  const BenchmarkConfig({
    required this.deviceAndOs,
    required this.performance,
    required this.featureSupport,
    required this.mainDomainScores,
  });

  factory BenchmarkConfig.fromJson(
    Map<String, dynamic> root, {
    DeviceAndOsRequirementsSet? deviceAndOsReqDefaults,
    DeviceAndOsWeightsSet? deviceAndOsWeightDefaults,
    PerformanceRequirementsSet? performanceReqDefaults,
    PerformanceWeightsSet? performanceWeightDefaults,
    FeatureSupportRequirementsSet? featureReqDefaults,
    FeatureSupportWeightsSet? featureWeightDefaults,
    MainDomainScoresSet? mainDefaults,
  }) {
    final dDefaults = DeviceAndOsDefaults();
    final pDefaults = PerformanceDefaults();
    final fDefaults = FeatureSupportDefaults();
    final mDefaults = MainDomainScoresDefaults();

    final deviceAndOsJson =
        JsonParser.toMap(root['deviceAndOs']) ?? const <String, dynamic>{};
    final performanceJson =
        JsonParser.toMap(root['performance']) ?? const <String, dynamic>{};
    final featureJson =
        JsonParser.toMap(root['featureSupport']) ?? const <String, dynamic>{};
    final mainJson =
        JsonParser.toMap(root['mainDomainScores']) ?? const <String, dynamic>{};

    final dRemote = DeviceAndOsRemotePartial.fromJson(deviceAndOsJson);
    final pRemote = PerformanceRemotePartial.fromJson(performanceJson);
    final fRemote = FeatureSupportRemotePartial.fromJson(featureJson);
    final mRemote = MainDomainScoresRemotePartial.fromJson(mainJson);

    return BenchmarkConfig(
      deviceAndOs: DeviceAndOsMerged(
        reqDefaults: deviceAndOsReqDefaults ?? dDefaults,
        weightDefaults: deviceAndOsWeightDefaults ?? dDefaults,
        remote: dRemote,
      ),
      performance: PerformanceMerged(
        reqDefaults: performanceReqDefaults ?? pDefaults,
        weightDefaults: performanceWeightDefaults ?? pDefaults,
        remote: pRemote,
      ),
      featureSupport: FeatureSupportMerged(
        reqDefaults: featureReqDefaults ?? fDefaults,
        weightDefaults: featureWeightDefaults ?? fDefaults,
        remote: fRemote,
      ),
      mainDomainScores: MainDomainScoresMerged(
        defaults: mainDefaults ?? mDefaults,
        remote: mRemote,
      ),
    );
  }
  @override
  String toString() {
    return '''
================= BENCHMARK CONFIG =================

---- MAIN DOMAIN SCORES ----
deviceAndOs: ${mainDomainScores.deviceAndOs}
performance: ${mainDomainScores.performance}
featureSupport: ${mainDomainScores.featureSupport}
thresholds:
  optimal: ${mainDomainScores.thresholds.optimal}
  supported: ${mainDomainScores.thresholds.supported}
  limited: ${mainDomainScores.thresholds.limited}

---- DEVICE & OS ----
Requirements:
  osVersion: ${deviceAndOs.osVersion}
  cpuArchitecture:
    optimal: ${deviceAndOs.cpuArchitecture.optimal}
    supported: ${deviceAndOs.cpuArchitecture.supported}
    limited: ${deviceAndOs.cpuArchitecture.limited}
    minimum: ${deviceAndOs.cpuArchitecture.minimum}
  cpuCores:
    optimal: ${deviceAndOs.cpuCores.optimal}
    supported: ${deviceAndOs.cpuCores.supported}
    limited: ${deviceAndOs.cpuCores.limited}
  cpuFrequencyMHz:
    optimal: ${deviceAndOs.cpuFrequencyMHz.optimal}
    supported: ${deviceAndOs.cpuFrequencyMHz.supported}
    limited: ${deviceAndOs.cpuFrequencyMHz.limited}
  ramGB:
    optimal: ${deviceAndOs.ramGB.optimal}
    supported: ${deviceAndOs.ramGB.supported}
    limited: ${deviceAndOs.ramGB.limited}
  storageGB:
    optimal: ${deviceAndOs.storageGB.optimal}
    supported: ${deviceAndOs.storageGB.supported}
    limited: ${deviceAndOs.storageGB.limited}

Weights:
  cpuSubArch: ${deviceAndOs.cpuSubArch}
  cpuSubCore: ${deviceAndOs.cpuSubCore}
  cpuSubFreq: ${deviceAndOs.cpuSubFreq}
  ramSub: ${deviceAndOs.ramSub}
  storageSub: ${deviceAndOs.storageSub}
  os: ${deviceAndOs.os}
  ramStorage: ${deviceAndOs.ramStorage}
  cpu: ${deviceAndOs.cpu}

---- PERFORMANCE ----
Requirements:
  fps:
    optimal: ${performance.fps.optimal}
    supported: ${performance.fps.supported}
    limited: ${performance.fps.limited}
  frameTimeMs:
    optimal: ${performance.frameTimeMs.optimal}
    supported: ${performance.frameTimeMs.supported}
    limited: ${performance.frameTimeMs.limited}
  cpuUsagePercent:
    optimal: ${performance.cpuUsagePercent.optimal}
    supported: ${performance.cpuUsagePercent.supported}
    limited: ${performance.cpuUsagePercent.limited}
  memoryUsageMB:
    optimal: ${performance.memoryUsageMB.optimal}
    supported: ${performance.memoryUsageMB.supported}
    limited: ${performance.memoryUsageMB.limited}

Weights:
  fpsWeight: ${performance.fpsWeight}
  frameTimeWeight: ${performance.frameTimeWeight}
  cpuWeight: ${performance.cpuWeight}
  memoryWeight: ${performance.memoryWeight}

---- FEATURE SUPPORT ----
Required Features:
  camera: ${featureSupport.requiredFeatures.camera}
  gps: ${featureSupport.requiredFeatures.gps}
  location: ${featureSupport.requiredFeatures.location}
  nfc: ${featureSupport.requiredFeatures.nfc}

Weights:
  camera: ${featureSupport.featureSuppCamera}
  gps: ${featureSupport.featureSuppGps}
  nfc: ${featureSupport.featureSuppNfc}

Thresholds:
  optimal: ${featureSupport.thresholds.optimal}
  supported: ${featureSupport.thresholds.supported}
  limited: ${featureSupport.thresholds.limited}

====================================================
''';
  }
}
