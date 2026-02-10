import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

abstract class FeatureSupportRequirementsSet {
  DefaultValue get featureSuppOptimalTotal;
  DefaultValue get featureSuppSupportedTotal;
  DefaultValue get featureLimitedTotal;
  DefaultValue get requiredFeatures;
}
