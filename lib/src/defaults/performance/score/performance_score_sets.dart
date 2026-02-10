import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

abstract class PerformanceScoreSet {
  // FPS
  DefaultValue get fpsOptimal;
  DefaultValue get fpsSupported;
  DefaultValue get fpsLimited;
  DefaultValue get fpsDegraded;
  DefaultValue get fpsMinimum;

  // Frame time
  DefaultValue get frameTimeOptimal;
  DefaultValue get frameTimeSupported;
  DefaultValue get frameTimeLimited;
  DefaultValue get frameTimeDegraded;
  DefaultValue get frameTimeMinimum;

  // CPU usage
  DefaultValue get cpuUsgOptimal;
  DefaultValue get cpuUsgSupported;
  DefaultValue get cpuUsgLimited;
  DefaultValue get cpuUsgDegraded;
  DefaultValue get cpuUsgMinimum;

  // Memory usage
  DefaultValue get memoryUsgOptimal;
  DefaultValue get memoryUsgSupported;
  DefaultValue get memoryUsgLimited;
  DefaultValue get memoryUsgMinimum;
}
