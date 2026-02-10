import 'package:app_compat_benchmark_core/src/defaults/feature_support/requirements/feature_support_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportRequirementsDbBundle
    implements FeatureSupportRequirementsSet {
  @override
  DefaultValue get featureLimitedTotal => throw UnimplementedError();

  @override
  DefaultValue get featureSuppOptimalTotal => throw UnimplementedError();

  @override
  DefaultValue get featureSuppSupportedTotal => throw UnimplementedError();

  @override
  DefaultValue get requiredFeatures => throw UnimplementedError();
}
