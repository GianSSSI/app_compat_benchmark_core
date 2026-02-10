import 'package:app_compat_benchmark_core/src/defaults/performance/score/performance_score_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/score/performance_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceScoreDefaultsBundle extends DefaultValue
    implements PerformanceScoreSet {
  const PerformanceScoreDefaultsBundle._() : super(key: 'default', value: 0);

  static const defaults = PerformanceScoreDefaultsBundle._();

  @override
  DefaultValue get fpsOptimal => PerformanceScoreDefaults.fpsOptimal;
  @override
  DefaultValue get fpsSupported => PerformanceScoreDefaults.fpsSupported;
  @override
  DefaultValue get fpsLimited => PerformanceScoreDefaults.fpsLimited;
  @override
  DefaultValue get fpsDegraded => PerformanceScoreDefaults.fpsDegraded;
  @override
  DefaultValue get fpsMinimum => PerformanceScoreDefaults.fpsMinimum;

  @override
  DefaultValue get frameTimeOptimal =>
      PerformanceScoreDefaults.frameTimeOptimal;
  @override
  DefaultValue get frameTimeSupported =>
      PerformanceScoreDefaults.frameTimeSupported;
  @override
  DefaultValue get frameTimeLimited =>
      PerformanceScoreDefaults.frameTimeLimited;
  @override
  DefaultValue get frameTimeDegraded =>
      PerformanceScoreDefaults.frameTimeDegraded;
  @override
  DefaultValue get frameTimeMinimum =>
      PerformanceScoreDefaults.frameTimeMinimum;

  @override
  DefaultValue get cpuUsgOptimal => PerformanceScoreDefaults.cpuUsgOptimal;
  @override
  DefaultValue get cpuUsgSupported => PerformanceScoreDefaults.cpuUsgSupported;
  @override
  DefaultValue get cpuUsgLimited => PerformanceScoreDefaults.cpuUsgLimited;
  @override
  DefaultValue get cpuUsgDegraded => PerformanceScoreDefaults.cpuUsgDegraded;
  @override
  DefaultValue get cpuUsgMinimum => PerformanceScoreDefaults.cpuUsgMinimum;

  @override
  DefaultValue get memoryUsgOptimal =>
      PerformanceScoreDefaults.memoryUsgOptimal;
  @override
  DefaultValue get memoryUsgSupported =>
      PerformanceScoreDefaults.memoryUsgSupported;
  @override
  DefaultValue get memoryUsgLimited =>
      PerformanceScoreDefaults.memoryUsgLimited;
  @override
  DefaultValue get memoryUsgMinimum =>
      PerformanceScoreDefaults.memoryUsgMinimum;
}
