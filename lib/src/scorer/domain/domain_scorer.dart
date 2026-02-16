import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/defaults/device_and_os_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/requirements/device_and_os_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/domain/defaults/domain_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/domain/score/main_somain_score_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/defaults/feature_support_default.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/requirements/feature_supp_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/defaults/performance_default.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/requirements/performance_req_set.dart';
import 'package:app_compat_benchmark_core/src/models/domain/overall_benchmark_score.dart';
import 'package:app_compat_benchmark_core/src/models/domain/performance_domain_score.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_score.dart';

class DomainScorer {
  final MainDomainScoresSet?
  mainDomainScoresSet; // weights of domains + overall thresholds
  final DeviceAndOsRequirementsSet?
  deviceAndOsRequirementsSet; // has thresholds
  final PerformanceRequirementsSet?
  performanceRequirementsSet; // has thresholds
  final FeatureSupportRequirementsSet?
  featureSupportRequirementsSet; // has thresholds

  DomainScorer({
    this.mainDomainScoresSet,
    this.deviceAndOsRequirementsSet,
    this.performanceRequirementsSet,
    this.featureSupportRequirementsSet,
  });

  // Defaults (NEW)
  MainDomainScoresSet get _main =>
      mainDomainScoresSet ?? MainDomainScoresDefaults();

  DeviceAndOsRequirementsSet get _deviceReq =>
      deviceAndOsRequirementsSet ?? DeviceAndOsDefaults();

  PerformanceRequirementsSet get _perfReq =>
      performanceRequirementsSet ?? PerformanceDefaults();

  FeatureSupportRequirementsSet get _featReq =>
      featureSupportRequirementsSet ?? FeatureSupportDefaults();

  OverallBenchmarkScore calculateFinalScore({
    required double device, // device domain overallScore (0-100)
    required FeatureSupportScore feature,
    required PerformanceDomainScore performance,
  }) {
    final score =
        device * _main.deviceAndOs +
        feature.overallScore * _main.featureSupport +
        performance.overallScore * _main.performance;

    final interpretation = interpretDomainScores(
      deviceAndOsScore: device,
      performanceScore: performance.overallScore,
      featureSupportScore: feature.overallScore,
    );

    final result = interpretOverallScore(score);

    return OverallBenchmarkScore(
      interpretation: interpretation,
      score: score,
      result: result,
    );
  }

  String interpretOverallScore(double overallScore) {
    final t = _main.thresholds; // TieredReq

    if (overallScore >= t.optimal) {
      return "Compatible";
    } else if (overallScore >= t.supported) {
      return "Limited Compatible";
    } else if (overallScore >= t.limited) {
      return "Partially Compatible";
    } else {
      return "Incompatible";
    }
  }

  Map<String, String> interpretDomainScores({
    required double deviceAndOsScore,
    required double performanceScore,
    required double featureSupportScore,
  }) {
    final Map<String, String> interpretations = {};

    // DEVICE & OS
    final dt = _deviceReq.thresholds; // TieredReq
    if (deviceAndOsScore >= dt.optimal) {
      interpretations["deviceAndOs"] = "Device & OS meet optimal requirements.";
    } else if (deviceAndOsScore >= dt.supported) {
      interpretations["deviceAndOs"] =
          "Device & OS are supported but have limitations.";
    } else if (deviceAndOsScore >= dt.limited) {
      interpretations["deviceAndOs"] = "Device & OS are minimally supported.";
    } else {
      interpretations["deviceAndOs"] =
          "Device & OS do not meet minimum requirements.";
    }

    // PERFORMANCE
    final pt = _perfReq.thresholds; // TieredReq
    if (performanceScore >= pt.optimal) {
      interpretations["performance"] = "Performance is stable and smooth.";
    } else if (performanceScore >= pt.supported) {
      interpretations["performance"] =
          "Performance is acceptable with occasional drops.";
    } else if (performanceScore >= pt.limited) {
      interpretations["performance"] = "Performance may be unstable.";
    } else {
      interpretations["performance"] = "Performance is poor and unreliable.";
    }

    // FEATURE SUPPORT
    final ft = _featReq.thresholds; // TieredReq
    if (featureSupportScore >= ft.optimal) {
      interpretations["featureSupport"] =
          "All required features are fully supported.";
    } else if (featureSupportScore >= ft.supported) {
      interpretations["featureSupport"] =
          "Most required features are supported.";
    } else if (featureSupportScore >= ft.limited) {
      interpretations["featureSupport"] = "Some required features are missing.";
    } else {
      interpretations["featureSupport"] =
          "Critical features are not supported.";
    }

    return interpretations;
  }
}
