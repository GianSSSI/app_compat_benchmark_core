import 'package:app_compat_benchmark_core/src/defaults/feature_support/weights/feature_support_weight_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/weights/feature_support_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportWeightsDefaultBundle extends DefaultValue
    implements FeatureSupportWeightsSet {
  const FeatureSupportWeightsDefaultBundle._()
    : super(key: 'default', value: 0);

  static const defaults = FeatureSupportWeightsDefaultBundle._();

  @override
  DefaultValue get featureSuppCamera =>
      FeatureSupportWeightDefault.featureSuppCamera;

  @override
  DefaultValue get featureSuppGps => FeatureSupportWeightDefault.featureSuppGps;
}
