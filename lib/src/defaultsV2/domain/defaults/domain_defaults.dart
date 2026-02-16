import 'package:app_compat_benchmark_core/src/defaultsV2/domain/score/main_somain_score_set.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class MainDomainScoresDefaults implements MainDomainScoresSet {
  @override
  double get deviceAndOs => 0.30;
  @override
  double get performance => 0.60;
  @override
  double get featureSupport => 0.10;

  @override
  TieredReq get thresholds =>
      const TieredReq(optimal: 80.0, supported: 60.0, limited: 40.0);
}
