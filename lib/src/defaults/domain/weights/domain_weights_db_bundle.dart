import 'package:app_compat_benchmark_core/src/defaults/domain/weights/domain_weights_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/domain/weights/domain_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DomainWeightsDbBundle implements DomainWeightsSet {
  final Map<String, DefaultValue> _weights;

  DomainWeightsDbBundle._(this._weights);

  factory DomainWeightsDbBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return DomainWeightsDbBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _weights[key] ?? fallback;

  @override
  DefaultValue get deviceAndOs =>
      _get('deviceAndOs', DomainWeightsDefault.deviceAndOs);

  @override
  DefaultValue get featureSuppport =>
      _get('featureSuppport', DomainWeightsDefault.featureSuppport);

  @override
  DefaultValue get performance =>
      _get('performance', DomainWeightsDefault.performance);
}
