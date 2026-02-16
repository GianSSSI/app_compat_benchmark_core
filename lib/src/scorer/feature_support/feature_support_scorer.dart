import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/defaults/feature_support_default.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/requirements/feature_supp_requirements_set.dart';

import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/scores/feature_support_score_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/scores/feature_support_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/weights/feature_supp_weight_set.dart';

import 'package:app_compat_benchmark_core/src/models/feature_support/feature_step_type.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_result.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_score.dart';

class FeatureSupportScorer {
  // NEW config sets
  final FeatureSupportWeightsSet? featureSupportWeightsSet;
  final FeatureSupportRequirementsSet? featureSupportRequirementsSet;

  // KEEP score rubric app-only
  final FeatureSupportScoresSets? featureSupportScoresSets;

  FeatureSupportScorer({
    this.featureSupportWeightsSet,
    this.featureSupportRequirementsSet,
    this.featureSupportScoresSets,
  });

  FeatureSupportScoresSets get _scores =>
      featureSupportScoresSets ?? FeatureSupportScoreDefaultBundle.defaults;

  // NEW defaults (from new system)
  FeatureSupportWeightsSet get _weights =>
      featureSupportWeightsSet ?? FeatureSupportDefaults();

  FeatureSupportRequirementsSet get _req =>
      featureSupportRequirementsSet ?? FeatureSupportDefaults();

  double scoreStatus(FeatureStatus status) {
    switch (status) {
      case FeatureStatus.ready:
      case FeatureStatus.supported:
        return _scores.featureSupported.value;

      case FeatureStatus.permissionDenied:
      case FeatureStatus.serviceDisabled:
      case FeatureStatus.runtimeFailed:
      case FeatureStatus.unsupported:
        return _scores.featureNotSupported.value;
    }
  }

  double featureWeight(FeatureStepType type) {
    switch (type) {
      case FeatureStepType.camera:
        return _weights.featureSuppCamera;
      case FeatureStepType.gps:
        return _weights.featureSuppGps; // ✅ FIXED (was camera weight)
      case FeatureStepType.nfc:
        return _weights.featureSuppNfc;
    }
  }

  bool _isRequired(FeatureStepType type) {
    final r = _req.requiredFeatures;

    switch (type) {
      case FeatureStepType.camera:
        return r.camera;
      case FeatureStepType.gps:
        // depending on your meaning, you might want gps OR location here.
        // If you treat them separately, add FeatureStepType.location too.
        return r.gps || r.location;
      case FeatureStepType.nfc:
        return r.nfc;
    }
  }

  FeatureSupportScore calculate(List<FeatureSuppResult> results) {
    // HARD BLOCKER CHECK (keep logic)
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

    for (final feature in results) {
      if (feature.incompatible) continue;

      // OPTIONAL but recommended: only score required features from config
      if (!_isRequired(feature.stepType)) continue;

      final score = scoreStatus(feature.status);
      final weight = featureWeight(feature.stepType);

      scores[feature.stepType] = score;

      weightedSum += score * weight;
      weightTotal += 100 * weight; // keep your math consistent
    }

    final overall = weightTotal == 0 ? 0 : (weightedSum / weightTotal) * 100;

    return FeatureSupportScore(
      featureScores: scores,
      overallScore: overall.toDouble(),
      isBlocked: false,
    );
  }
}
