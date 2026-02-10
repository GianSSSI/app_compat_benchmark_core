import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceRequirementsDefaults {
  //fps
  static const fpsOptimal = DefaultValue(key: 'fpsOptimal', value: 90);
  static const fpsSupported = DefaultValue(key: 'fpsSupported', value: 60);
  static const fpsLimited = DefaultValue(key: 'fpsLimited', value: 45);
  static const fpsDegraded = DefaultValue(key: 'fpsDegraded', value: 30);

  //frametime
  static const frameTimeOptimal = DefaultValue(
    key: 'frameTimeOptimal',
    value: 8,
  );
  static const frameTimeSupported = DefaultValue(
    key: 'frameTimeSupported',
    value: 16,
  );
  static const frameTimeLimited = DefaultValue(
    key: 'frameTimeLimited',
    value: 24,
  );
  static const frameTimeDegraded = DefaultValue(
    key: 'frameTimeDegraded',
    value: 32,
  );

  //cpu usage
  static const cpuUsgOptimal = DefaultValue(key: 'cpuUsgOptimal', value: 20);
  static const cpuUsgSupported = DefaultValue(
    key: 'cpuUsgSupported',
    value: 35,
  );
  static const cpuUsgLimited = DefaultValue(key: 'cpuUsgLimited', value: 50);
  static const cpuUsgDegraded = DefaultValue(key: 'cpuUsgDegraded', value: 70);

  //memory usage
  static const memoryUsgOptimal = DefaultValue(
    key: 'memoryUsgOptimal',
    value: 500,
  );
  static const memoryUsgSupported = DefaultValue(
    key: 'memoryUsgSupported',
    value: 700,
  );
  static const memoryUsgLimited = DefaultValue(
    key: 'memoryUsgLimited',
    value: 900,
  );

  //performance overall score
  static const performanceOptimalTotal = DefaultValue(
    key: 'performanceOptimalTotal',
    value: 90,
  );
  static const performanceSupportedTotal = DefaultValue(
    key: 'performanceSupportedTotal',
    value: 85,
  );
  static const performanceLimitedTotal = DefaultValue(
    key: 'performanceLimitedTotal',
    value: 60,
  );
}
