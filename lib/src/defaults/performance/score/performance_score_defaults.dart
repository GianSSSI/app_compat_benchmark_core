import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceScoreDefaults {
  //fps
  static const fpsOptimal = DefaultValue(key: 'fpsOptimal', value: 100);
  static const fpsSupported = DefaultValue(key: 'fpsSupported', value: 85);
  static const fpsLimited = DefaultValue(key: 'fpsLimited', value: 70);
  static const fpsDegraded = DefaultValue(key: 'fpsDegraded', value: 50);
  static const fpsMinimum = DefaultValue(key: 'fpsMinimum', value: 20);

  //frame time
  static const frameTimeOptimal = DefaultValue(
    key: 'frameTimeOptimal',
    value: 100,
  );
  static const frameTimeSupported = DefaultValue(
    key: 'frameTimeSupported',
    value: 85,
  );
  static const frameTimeLimited = DefaultValue(
    key: 'frameTimeLimited',
    value: 65,
  );
  static const frameTimeDegraded = DefaultValue(
    key: 'frameTimeDegraded',
    value: 45,
  );

  static const frameTimeMinimum = DefaultValue(
    key: 'frameTimeMinimum',
    value: 20,
  );

  //cpu usage
  static const cpuUsgOptimal = DefaultValue(key: 'cpuUsgOptimal', value: 100);
  static const cpuUsgSupported = DefaultValue(
    key: 'cpuUsgSupported',
    value: 80,
  );
  static const cpuUsgLimited = DefaultValue(key: 'cpuUsgLimited', value: 60);
  static const cpuUsgDegraded = DefaultValue(key: 'cpuUsgDegraded', value: 40);
  static const cpuUsgMinimum = DefaultValue(key: 'cpuUsgMinimum', value: 20);

  //memory usage
  static const memoryUsgOptimal = DefaultValue(
    key: 'memoryUsgOptimal',
    value: 100,
  );
  static const memoryUsgSupported = DefaultValue(
    key: 'memoryUsgSupported',
    value: 80,
  );
  static const memoryUsgLimited = DefaultValue(
    key: 'memoryUsgLimited',
    value: 60,
  );
  static const memoryUsgMinimum = DefaultValue(
    key: 'memoryUsgMinimum',
    value: 40,
  );
}
