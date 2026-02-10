import 'package:app_compat_benchmark_core/src/models/feature_support/feature_step_type.dart';

class FeatureSupportScore {
  final Map<FeatureStepType, double> featureScores;

  final double overallScore;
  final bool isBlocked;

  const FeatureSupportScore({
    required this.featureScores,
    required this.overallScore,
    this.isBlocked = false,
  });
}
