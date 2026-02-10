import 'package:app_compat_benchmark_core/app_compat_benchmark_core.dart';
import 'package:app_compat_benchmark_core/src/models/domain/overall_benchmark_score.dart';
import 'package:app_compat_benchmark_core/src/models/domain/performance_domain_score.dart';

class DomainScorer {
  final PerformanceRequirementsSet? performanceRequirementsSet;
  final DeviceAndOsRequirementsSet? deviceAndOsRequirementsSet;
  final OverallScoreRequirementsSet? overallScoreRequirementsSet;
  final FeatureSupportRequirementsSet? featureSupportRequirementsSet;
  final DomainWeightsSet? domainWeights;

  DomainScorer({
    this.performanceRequirementsSet,
    this.deviceAndOsRequirementsSet,
    this.overallScoreRequirementsSet,
    this.featureSupportRequirementsSet,
    this.domainWeights,
  });

  DomainWeightsSet get _weights =>
      domainWeights ?? DomainWeightsDefaultBundle.defaults;
  OverallScoreRequirementsSet get scoreThresholds =>
      overallScoreRequirementsSet ??
      OverallScoreRequirementsDefaultsBundle.defaults;
  DeviceAndOsRequirementsSet get _deviceOsRequirements =>
      deviceAndOsRequirementsSet ??
      DeviceAndOsRequirementsDefaultBundle.defaults;
  PerformanceRequirementsSet get _perfRequirements =>
      performanceRequirementsSet ??
      PerformanceRequirementsDefaultsBundle.defaults;
  FeatureSupportRequirementsSet get _featSUppRequirements =>
      featureSupportRequirementsSet ??
      FeatureSupportRequirementsDefaultsBundle.defaults;

  OverallBenchmarkScore calculateFinalScore({
    required double device,
    required FeatureSupportScore feature,
    required PerformanceDomainScore performance,
  }) {
    final score =
        device * _weights.deviceAndOs.value +
        feature.overallScore * _weights.featureSuppport.value +
        performance.overallScore * _weights.performance.value;

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
    if (overallScore >= scoreThresholds.optimalOverall.value) {
      return "Compatible";
    } else if (overallScore >= scoreThresholds.supportedOverall.value) {
      return "Limited Compatible";
    } else if (overallScore >= scoreThresholds.limitedOverall.value) {
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
    if (deviceAndOsScore >= _deviceOsRequirements.deviceOsOptimalTotal.value) {
      interpretations["deviceAndOs"] = "Device & OS meet optimal requirements.";
    } else if (deviceAndOsScore >=
        _deviceOsRequirements.deviceOsSupportedTotal.value) {
      interpretations["deviceAndOs"] =
          "Device & OS are supported but have limitations.";
    } else if (deviceAndOsScore >=
        _deviceOsRequirements.deviceOsLimitedTotal.value) {
      interpretations["deviceAndOs"] = "Device & OS are minimally supported.";
    } else {
      interpretations["deviceAndOs"] =
          "Device & OS do not meet minimum requirements.";
    }

    // PERFORMANCE
    if (performanceScore >= _perfRequirements.performanceOptimalTotal.value) {
      interpretations["performance"] = "Performance is stable and smooth.";
    } else if (performanceScore >=
        _perfRequirements.performanceSupportedTotal.value) {
      interpretations["performance"] =
          "Performance is acceptable with occasional drops.";
    } else if (performanceScore >=
        _perfRequirements.performanceLimitedTotal.value) {
      interpretations["performance"] = "Performance may be unstable.";
    } else {
      interpretations["performance"] = "Performance is poor and unreliable.";
    }

    // FEATURE SUPPORT
    if (featureSupportScore >=
        _featSUppRequirements.featureSuppOptimalTotal.value) {
      interpretations["featureSupport"] =
          "All required features are fully supported.";
    } else if (featureSupportScore >=
        _featSUppRequirements.featureSuppSupportedTotal.value) {
      interpretations["featureSupport"] =
          "Most required features are supported.";
    } else if (featureSupportScore >=
        _featSUppRequirements.featureLimitedTotal.value) {
      interpretations["featureSupport"] = "Some required features are missing.";
    } else {
      interpretations["featureSupport"] =
          "Critical features are not supported.";
    }

    return interpretations;
  }
}
