import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

abstract class PerformanceWeightsSet {
  DefaultValue get fpsWeight;
  DefaultValue get frameTimeWeight;
  DefaultValue get cpuWeight;
  DefaultValue get memoryWeight;
}
