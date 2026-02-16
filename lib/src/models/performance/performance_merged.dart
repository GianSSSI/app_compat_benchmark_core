import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/requirements/performance_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/weights/performance_weights_set.dart';
import 'package:app_compat_benchmark_core/src/models/performance/performance_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class PerformanceMerged
    implements PerformanceRequirementsSet, PerformanceWeightsSet {
  final PerformanceRequirementsSet reqDefaults;
  final PerformanceWeightsSet weightDefaults;
  final PerformanceRemotePartial remote;

  PerformanceMerged({
    required this.reqDefaults,
    required this.weightDefaults,
    required this.remote,
  });

  @override
  TieredReq get fps => remote.fps ?? reqDefaults.fps;

  @override
  TieredReq get frameTimeMs => remote.frameTimeMs ?? reqDefaults.frameTimeMs;

  @override
  TieredReq get cpuUsagePercent =>
      remote.cpuUsagePercent ?? reqDefaults.cpuUsagePercent;

  @override
  TieredReq get memoryUsageMB =>
      remote.memoryUsageMB ?? reqDefaults.memoryUsageMB;

  @override
  TieredReq get thresholds => remote.thresholds ?? reqDefaults.thresholds;

  @override
  double get fpsWeight => remote.fpsWeight ?? weightDefaults.fpsWeight;

  @override
  double get frameTimeWeight =>
      remote.frameTimeWeight ?? weightDefaults.frameTimeWeight;

  @override
  double get cpuWeight => remote.cpuWeight ?? weightDefaults.cpuWeight;

  @override
  double get memoryWeight => remote.memoryWeight ?? weightDefaults.memoryWeight;
}
