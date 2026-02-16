import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/requirements/feature_supp_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/weights/feature_supp_weight_set.dart';

import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_remote_partials.dart';
import 'package:app_compat_benchmark_core/src/models/shared/required_features.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class FeatureSupportMerged
    implements FeatureSupportRequirementsSet, FeatureSupportWeightsSet {
  final FeatureSupportRequirementsSet reqDefaults;
  final FeatureSupportWeightsSet weightDefaults;
  final FeatureSupportRemotePartial remote;

  FeatureSupportMerged({
    required this.reqDefaults,
    required this.weightDefaults,
    required this.remote,
  });

  @override
  RequiredFeatures get requiredFeatures =>
      remote.requiredFeatures ?? reqDefaults.requiredFeatures;

  @override
  TieredReq get thresholds => remote.thresholds ?? reqDefaults.thresholds;

  @override
  double get featureSuppCamera =>
      remote.featureSuppCamera ?? weightDefaults.featureSuppCamera;

  @override
  double get featureSuppNfc =>
      remote.featureSuppNfc ?? weightDefaults.featureSuppNfc;

  @override
  double get featureSuppGps =>
      remote.featureSuppGps ?? weightDefaults.featureSuppGps;
}
