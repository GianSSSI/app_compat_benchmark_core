import 'package:app_compat_benchmark_core/src/defaults/performance/weights/performance_weights_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/weights/performance_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceJsonBundle implements PerformanceWeightsSet {
  final Map<String, DefaultValue> _weights;

  PerformanceJsonBundle._(this._weights);

  factory PerformanceJsonBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return PerformanceJsonBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _weights[key] ?? fallback;

  @override
  DefaultValue get cpuWeight =>
      _get('cpuWeight', PerformanceWeightsDefault.cpuWeight);

  @override
  DefaultValue get fpsWeight =>
      _get('fpsWeight', PerformanceWeightsDefault.fpsWeight);

  @override
  DefaultValue get frameTimeWeight =>
      _get('frameTimeWeight', PerformanceWeightsDefault.frameTimeWeight);

  @override
  DefaultValue get memoryWeight =>
      _get('memoryWeight', PerformanceWeightsDefault.memoryWeight);
}
