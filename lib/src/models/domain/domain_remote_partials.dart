import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class MainDomainScoresRemotePartial {
  final double? deviceAndOs;
  final double? performance;
  final double? featureSupport;
  final TieredReq? thresholds;

  const MainDomainScoresRemotePartial({
    this.deviceAndOs,
    this.performance,
    this.featureSupport,
    this.thresholds,
  });

  factory MainDomainScoresRemotePartial.fromJson(Map<String, dynamic> json) {
    final th = JsonParser.toMap(json['thresholds']);
    TieredReq? t() {
      if (th == null) return null;
      try {
        return TieredReq.fromJson(th);
      } catch (_) {
        return null;
      }
    }

    return MainDomainScoresRemotePartial(
      deviceAndOs: JsonParser.toDoubleOrNull(json['deviceAndOs']),
      performance: JsonParser.toDoubleOrNull(json['performance']),
      featureSupport: JsonParser.toDoubleOrNull(json['featureSupport']),
      thresholds: t(),
    );
  }
}
