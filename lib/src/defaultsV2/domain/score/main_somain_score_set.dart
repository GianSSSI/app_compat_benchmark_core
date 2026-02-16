import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

abstract class MainDomainScoresSet {
  double get deviceAndOs;
  double get performance;
  double get featureSupport;
  TieredReq get thresholds;
}
