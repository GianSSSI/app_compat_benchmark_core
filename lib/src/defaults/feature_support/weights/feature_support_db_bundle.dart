import 'package:app_compat_benchmark_core/src/defaults/feature_support/weights/feature_support_weight_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/weights/feature_support_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportJsonBundle implements FeatureSupportWeightsSet {
  final Map<String, DefaultValue> _weights;

  FeatureSupportJsonBundle._(this._weights);

  factory FeatureSupportJsonBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return FeatureSupportJsonBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _weights[key] ?? fallback;

  @override
  DefaultValue get featureSuppCamera =>
      _get('featureSuppCamera', FeatureSupportWeightDefault.featureSuppCamera);

  @override
  DefaultValue get featureSuppGps =>
      _get('featureSuppGps', FeatureSupportWeightDefault.featureSuppGps);
}
