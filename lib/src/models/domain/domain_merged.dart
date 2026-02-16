import 'package:app_compat_benchmark_core/src/defaultsV2/domain/score/main_somain_score_set.dart';
import 'package:app_compat_benchmark_core/src/models/domain/domain_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class MainDomainScoresMerged implements MainDomainScoresSet {
  final MainDomainScoresSet defaults;
  final MainDomainScoresRemotePartial remote;

  MainDomainScoresMerged({required this.defaults, required this.remote});

  @override
  double get deviceAndOs => remote.deviceAndOs ?? defaults.deviceAndOs;

  @override
  double get performance => remote.performance ?? defaults.performance;

  @override
  double get featureSupport => remote.featureSupport ?? defaults.featureSupport;

  @override
  TieredReq get thresholds => remote.thresholds ?? defaults.thresholds;
}
