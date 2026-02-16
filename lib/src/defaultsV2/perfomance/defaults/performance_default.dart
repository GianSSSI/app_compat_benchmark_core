import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/requirements/performance_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/weights/performance_weights_set.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class PerformanceDefaults
    implements PerformanceRequirementsSet, PerformanceWeightsSet {
  @override
  TieredReq get fps =>
      const TieredReq(optimal: 60, supported: 45, limited: 30, degraded: 15);

  @override
  TieredReq get frameTimeMs =>
      const TieredReq(optimal: 16, supported: 22, limited: 33, degraded: 66);

  @override
  TieredReq get cpuUsagePercent =>
      const TieredReq(optimal: 20, supported: 35, limited: 50, degraded: 70);

  @override
  TieredReq get memoryUsageMB =>
      const TieredReq(optimal: 300, supported: 500, limited: 700);

  @override
  TieredReq get thresholds =>
      const TieredReq(optimal: 80, supported: 60, limited: 40);

  @override
  double get fpsWeight => 0.40;

  @override
  double get frameTimeWeight => 0.30;

  @override
  double get cpuWeight => 0.20;

  @override
  double get memoryWeight => 0.10;
}
