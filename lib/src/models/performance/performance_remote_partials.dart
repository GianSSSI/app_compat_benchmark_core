import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class PerformanceRemotePartial {
  final TieredReq? fps;
  final TieredReq? frameTimeMs;
  final TieredReq? cpuUsagePercent;
  final TieredReq? memoryUsageMB;
  final TieredReq? thresholds;

  final double? fpsWeight;
  final double? frameTimeWeight;
  final double? cpuWeight;
  final double? memoryWeight;

  const PerformanceRemotePartial({
    this.fps,
    this.frameTimeMs,
    this.cpuUsagePercent,
    this.memoryUsageMB,
    this.thresholds,
    this.fpsWeight,
    this.frameTimeWeight,
    this.cpuWeight,
    this.memoryWeight,
  });

  factory PerformanceRemotePartial.fromJson(
    Map<String, dynamic> performanceJson,
  ) {
    final weights = JsonParser.toMap(performanceJson['weights']);
    final req = JsonParser.toMap(performanceJson['requirements']);
    final th = JsonParser.toMap(performanceJson['thresholds']);

    TieredReq? tier(String k) {
      final m = req == null ? null : JsonParser.toMap(req[k]);
      if (m == null) return null;
      try {
        return TieredReq.fromJson(m);
      } catch (_) {
        return null;
      }
    }

    TieredReq? thresholds() {
      if (th == null) return null;
      try {
        return TieredReq.fromJson(th);
      } catch (_) {
        return null;
      }
    }

    return PerformanceRemotePartial(
      fps: tier('fps'),
      frameTimeMs: tier('frameTimeMs'),
      cpuUsagePercent: tier('cpuUsagePercent'),
      memoryUsageMB: tier('memoryUsageMB'),
      thresholds: thresholds(),
      fpsWeight: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['fpsWeight']),
      frameTimeWeight: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['frameTimeWeight']),
      cpuWeight: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['cpuWeight']),
      memoryWeight: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['memoryWeight']),
    );
  }
}
