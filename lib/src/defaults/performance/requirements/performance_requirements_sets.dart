import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

abstract class PerformanceRequirementsSet {
  // FPS
  DefaultValue get fpsOptimal;
  DefaultValue get fpsSupported;
  DefaultValue get fpsLimited;
  DefaultValue get fpsDegraded;

  // Frame time
  DefaultValue get frameTimeOptimal;
  DefaultValue get frameTimeSupported;
  DefaultValue get frameTimeLimited;
  DefaultValue get frameTimeDegraded;

  // CPU usage
  DefaultValue get cpuOptimal;
  DefaultValue get cpuSupported;
  DefaultValue get cpuLimited;
  DefaultValue get cpuDegraded;

  // Memory usage
  DefaultValue get memoryOptimal;
  DefaultValue get memorySupported;
  DefaultValue get memoryLimited;

  //toal performance threshold
  DefaultValue get performanceOptimalTotal;
  DefaultValue get performanceSupportedTotal;
  DefaultValue get performanceLimitedTotal;
}
