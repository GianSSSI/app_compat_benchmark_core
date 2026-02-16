import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

abstract class PerformanceRequirementsSet {
  TieredReq get fps;
  TieredReq get frameTimeMs;
  TieredReq get cpuUsagePercent;
  TieredReq get memoryUsageMB;
  TieredReq get thresholds;
}
