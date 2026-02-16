import 'package:app_compat_benchmark_core/src/models/shared/default_value.dart';

class PerformanceScoreDefaults {
  //fps
  static const fpsOptimal = DefaultValue(key: 'fpsOptimal', value: 100.0);
  static const fpsSupported = DefaultValue(key: 'fpsSupported', value: 85.0);
  static const fpsLimited = DefaultValue(key: 'fpsLimited', value: 70.0);
  static const fpsDegraded = DefaultValue(key: 'fpsDegraded', value: 50.0);
  static const fpsMinimum = DefaultValue(key: 'fpsMinimum', value: 20.0);

  //frame time
  static const frameTimeOptimal = DefaultValue(
    key: 'frameTimeOptimal',
    value: 100.0,
  );
  static const frameTimeSupported = DefaultValue(
    key: 'frameTimeSupported',
    value: 85.0,
  );
  static const frameTimeLimited = DefaultValue(
    key: 'frameTimeLimited',
    value: 65.0,
  );
  static const frameTimeDegraded = DefaultValue(
    key: 'frameTimeDegraded',
    value: 45.0,
  );

  static const frameTimeMinimum = DefaultValue(
    key: 'frameTimeMinimum',
    value: 20.0,
  );

  //cpu usage
  static const cpuUsgOptimal = DefaultValue(key: 'cpuUsgOptimal', value: 100.0);
  static const cpuUsgSupported = DefaultValue(
    key: 'cpuUsgSupported',
    value: 80.0,
  );
  static const cpuUsgLimited = DefaultValue(key: 'cpuUsgLimited', value: 60.0);
  static const cpuUsgDegraded = DefaultValue(
    key: 'cpuUsgDegraded',
    value: 40.0,
  );
  static const cpuUsgMinimum = DefaultValue(key: 'cpuUsgMinimum', value: 20.0);

  //memory usage
  static const memoryUsgOptimal = DefaultValue(
    key: 'memoryUsgOptimal',
    value: 100.0,
  );
  static const memoryUsgSupported = DefaultValue(
    key: 'memoryUsgSupported',
    value: 80.0,
  );
  static const memoryUsgLimited = DefaultValue(
    key: 'memoryUsgLimited',
    value: 60.0,
  );
  static const memoryUsgMinimum = DefaultValue(
    key: 'memoryUsgMinimum',
    value: 40.0,
  );
}
