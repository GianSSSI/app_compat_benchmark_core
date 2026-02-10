import 'package:app_compat_benchmark_core/src/defaults/feature_support/score/feature_support_score_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/score/feature_support_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/weights/feature_support_weights_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/weights/feature_support_weights_set.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_step_type.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_result.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_score.dart';

class FeatureSupportScorer {
  final FeatureSupportWeightsSet? featureSupportWeightsSet;
  final FeatureSupportScoresSets? featureSupportScoresSets;
  FeatureSupportScorer({
    this.featureSupportWeightsSet,
    this.featureSupportScoresSets,
  });
  FeatureSupportScoresSets get _scores =>
      featureSupportScoresSets ?? FeatureSupportScoreDefaultBundle.defaults;

  FeatureSupportWeightsSet get _weights =>
      featureSupportWeightsSet ?? FeatureSupportWeightsDefaultBundle.defaults;

  double scoreStatus(FeatureStatus status) {
    switch (status) {
      case FeatureStatus.ready:
        return _scores.featureSupported.value;
      case FeatureStatus.supported:
        return _scores.featureSupported.value;
      case FeatureStatus.permissionDenied:
        return _scores.featureNotSupported.value;
      case FeatureStatus.serviceDisabled:
        return _scores.featureNotSupported.value;
      case FeatureStatus.runtimeFailed:
        return _scores.featureNotSupported.value;
      case FeatureStatus.unsupported:
        return _scores.featureNotSupported.value;
    }
  }

  double featureWeight(FeatureStepType type) {
    switch (type) {
      case FeatureStepType.camera:
        return _weights.featureSuppCamera.value;
      case FeatureStepType.gps:
        return _weights.featureSuppCamera.value;
    }
  }

  FeatureSupportScore calculate(List<FeatureSuppResult> results) {
    // HARD BLOCKER CHECK
    final hasHardBlocker = results.any(
      (r) => r.incompatible && r.stepType.isHardBlocker,
    );

    if (hasHardBlocker) {
      return FeatureSupportScore(
        featureScores: const {},
        overallScore: 0,
        isBlocked: true,
      );
    }

    final Map<FeatureStepType, double> scores = {};
    double weightedSum = 0;
    double weightTotal = 0;

    for (var feature in results) {
      if (feature.incompatible) continue;

      final score = scoreStatus(feature.status);
      if (score < 0) continue;

      final weight = featureWeight(feature.stepType);

      scores[feature.stepType] = score;
      weightedSum += score * weight;
      weightTotal += 100 * weight;
    }

    final double overall = weightTotal == 0
        ? 0
        : (weightedSum / weightTotal) * 100;

    return FeatureSupportScore(
      featureScores: scores,
      overallScore: overall,
      isBlocked: false,
    );
  }

  // static FeatureSupportScore calculate(
  //   Map<FeatureStepType, FeatureCheckResult> results,
  // ) {
  //   final Map<FeatureStepType, int> scores = {};
  //   int weightedSum = 0;
  //   int weightTotal = 0;

  //   results.forEach((feature, result) {
  //     final score = scoreStatus(result.status);
  //     final weight = featureWeight(feature);

  //     scores[feature] = score;
  //     weightedSum += score * weight;
  //     weightTotal += 100 * weight;
  //   });

  //   final double overall = weightTotal == 0
  //       ? 0
  //       : (weightedSum / weightTotal) * 100;

  //   return FeatureSupportScore(featureScores: scores, overallScore: overall);
  // }
}
