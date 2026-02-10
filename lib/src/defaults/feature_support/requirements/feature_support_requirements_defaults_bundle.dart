import 'package:app_compat_benchmark_core/src/defaults/feature_support/requirements/feature_support_requirements_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/requirements/feature_support_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportRequirementsDefaultsBundle extends DefaultValue
    implements FeatureSupportRequirementsSet {
  const FeatureSupportRequirementsDefaultsBundle._()
    : super(key: 'default', value: 0);

  static const defaults = FeatureSupportRequirementsDefaultsBundle._();

  @override
  DefaultValue get featureLimitedTotal =>
      FeatureSupportRequirementsDefaults.featureSuppOptimalTotal;

  @override
  DefaultValue get featureSuppOptimalTotal =>
      FeatureSupportRequirementsDefaults.featureSuppSupportedTotal;

  @override
  DefaultValue get featureSuppSupportedTotal =>
      FeatureSupportRequirementsDefaults.featureLimitedTotal;

  @override
  DefaultValue get requiredFeatures =>
      FeatureSupportRequirementsDefaults.requiredFeatures;
}
