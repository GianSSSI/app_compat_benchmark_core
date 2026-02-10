import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceWeightsDefault {
  static const fpsWeight = DefaultValue(key: 'fpsWeight', value: .4);
  static const frameTimeWeight = DefaultValue(
    key: 'frameTimeWeight',
    value: .3,
  );
  static const cpuWeight = DefaultValue(key: 'cpuWeight', value: .2);
  static const memoryWeight = DefaultValue(key: 'memoryWeight', value: .1);
}
