import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_step_type.dart';

class FeatureSupportRequirementsDefaults {
  //features

  static const requiredFeatures = DefaultValue(
    key: 'requiredFeatures',
    value: {FeatureStepType.gps: true, FeatureStepType.camera: true},
  );

  //Scores
  static const featureSuppOptimalTotal = DefaultValue(
    key: 'featureSuppOptimalTotal',
    value: 90,
  );
  static const featureSuppSupportedTotal = DefaultValue(
    key: 'featureSuppSupportedTotal',
    value: 85,
  );
  static const featureLimitedTotal = DefaultValue(
    key: 'featureLimitedTotal',
    value: 60,
  );
}
