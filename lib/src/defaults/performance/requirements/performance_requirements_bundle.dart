import 'package:app_compat_benchmark_core/src/defaults/performance/requirements/performance_requirements_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/requirements/performance_requirements_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceRequirementsDefaultsBundle extends DefaultValue
    implements PerformanceRequirementsSet {
  const PerformanceRequirementsDefaultsBundle._()
    : super(key: 'default', value: 0);

  static const defaults = PerformanceRequirementsDefaultsBundle._();

  // ---------- FPS ----------
  @override
  DefaultValue get fpsOptimal => PerformanceRequirementsDefaults.fpsOptimal;

  @override
  DefaultValue get fpsSupported => PerformanceRequirementsDefaults.fpsSupported;

  @override
  DefaultValue get fpsLimited => PerformanceRequirementsDefaults.fpsLimited;

  @override
  DefaultValue get fpsDegraded => PerformanceRequirementsDefaults.fpsDegraded;

  // ---------- FRAME TIME ----------
  @override
  DefaultValue get frameTimeOptimal =>
      PerformanceRequirementsDefaults.frameTimeOptimal;

  @override
  DefaultValue get frameTimeSupported =>
      PerformanceRequirementsDefaults.frameTimeSupported;

  @override
  DefaultValue get frameTimeLimited =>
      PerformanceRequirementsDefaults.frameTimeLimited;

  @override
  DefaultValue get frameTimeDegraded =>
      PerformanceRequirementsDefaults.frameTimeDegraded;

  // ---------- CPU USAGE ----------
  @override
  DefaultValue get cpuOptimal => PerformanceRequirementsDefaults.cpuUsgOptimal;

  @override
  DefaultValue get cpuSupported =>
      PerformanceRequirementsDefaults.cpuUsgSupported;

  @override
  DefaultValue get cpuLimited => PerformanceRequirementsDefaults.cpuUsgLimited;

  @override
  DefaultValue get cpuDegraded =>
      PerformanceRequirementsDefaults.cpuUsgDegraded;

  // ---------- MEMORY USAGE ----------
  @override
  DefaultValue get memoryOptimal =>
      PerformanceRequirementsDefaults.memoryUsgOptimal;

  @override
  DefaultValue get memorySupported =>
      PerformanceRequirementsDefaults.memoryUsgSupported;

  @override
  DefaultValue get memoryLimited =>
      PerformanceRequirementsDefaults.memoryUsgLimited;

  @override
  DefaultValue get performanceOptimalTotal =>
      PerformanceRequirementsDefaults.performanceOptimalTotal;

  @override
  DefaultValue get performanceSupportedTotal =>
      PerformanceRequirementsDefaults.memoryUsgLimited;

  @override
  DefaultValue get performanceLimitedTotal =>
      PerformanceRequirementsDefaults.performanceLimitedTotal;
}
