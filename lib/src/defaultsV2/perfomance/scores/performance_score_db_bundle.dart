import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/scores/performance_score_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/scores/performance_score_sets.dart';
import 'package:app_compat_benchmark_core/src/models/shared/default_value.dart';

class PerformanceScoreJsonDbBundle implements PerformanceScoreSet {
  final Map<String, DefaultValue> _scores;

  PerformanceScoreJsonDbBundle._(this._scores);

  factory PerformanceScoreJsonDbBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return PerformanceScoreJsonDbBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _scores[key] ?? fallback;

  @override
  DefaultValue get cpuUsgDegraded =>
      _get('featureNotSupported', PerformanceScoreDefaults.cpuUsgDegraded);

  @override
  DefaultValue get cpuUsgLimited =>
      _get('cpuUsgLimited', PerformanceScoreDefaults.cpuUsgLimited);

  @override
  DefaultValue get cpuUsgMinimum =>
      _get('cpuUsgMinimum', PerformanceScoreDefaults.cpuUsgMinimum);

  @override
  DefaultValue get cpuUsgOptimal =>
      _get('cpuUsgOptimal', PerformanceScoreDefaults.cpuUsgOptimal);

  @override
  DefaultValue get cpuUsgSupported =>
      _get('cpuUsgSupported', PerformanceScoreDefaults.cpuUsgSupported);

  @override
  DefaultValue get fpsDegraded =>
      _get('fpsDegraded', PerformanceScoreDefaults.fpsDegraded);

  @override
  DefaultValue get fpsLimited =>
      _get('fpsLimited', PerformanceScoreDefaults.fpsLimited);

  @override
  DefaultValue get fpsMinimum =>
      _get('fpsMinimum', PerformanceScoreDefaults.fpsMinimum);

  @override
  DefaultValue get fpsOptimal =>
      _get('fpsOptimal', PerformanceScoreDefaults.fpsOptimal);

  @override
  DefaultValue get fpsSupported =>
      _get('fpsSupported', PerformanceScoreDefaults.fpsSupported);

  @override
  DefaultValue get frameTimeDegraded =>
      _get('frameTimeDegraded', PerformanceScoreDefaults.frameTimeDegraded);

  @override
  DefaultValue get frameTimeLimited =>
      _get('frameTimeLimited', PerformanceScoreDefaults.frameTimeLimited);

  @override
  DefaultValue get frameTimeMinimum =>
      _get('frameTimeMinimum', PerformanceScoreDefaults.frameTimeMinimum);

  @override
  DefaultValue get frameTimeOptimal =>
      _get('frameTimeOptimal', PerformanceScoreDefaults.frameTimeOptimal);

  @override
  DefaultValue get frameTimeSupported =>
      _get('frameTimeSupported', PerformanceScoreDefaults.frameTimeSupported);

  @override
  DefaultValue get memoryUsgLimited =>
      _get('memoryUsgLimited', PerformanceScoreDefaults.memoryUsgLimited);

  @override
  DefaultValue get memoryUsgMinimum =>
      _get('memoryUsgMinimum', PerformanceScoreDefaults.memoryUsgMinimum);

  @override
  DefaultValue get memoryUsgOptimal =>
      _get('memoryUsgOptimal', PerformanceScoreDefaults.memoryUsgOptimal);

  @override
  DefaultValue get memoryUsgSupported =>
      _get('memoryUsgSupported', PerformanceScoreDefaults.memoryUsgSupported);
}
