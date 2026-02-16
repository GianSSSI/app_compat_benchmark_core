import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/requirements/feature_supp_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/feature_support/weights/feature_supp_weight_set.dart';

import 'package:app_compat_benchmark_core/src/models/shared/required_features.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class FeatureSupportDefaults
    implements FeatureSupportRequirementsSet, FeatureSupportWeightsSet {
  @override
  double get featureSuppCamera => 4.0;

  @override
  double get featureSuppNfc => 3.0;

  @override
  double get featureSuppGps => 2.0;

  @override
  RequiredFeatures get requiredFeatures => const RequiredFeatures(
    gps: true,
    location: true,
    camera: true,
    nfc: true,
  );

  @override
  TieredReq get thresholds =>
      const TieredReq(optimal: 80.0, supported: 60.0, limited: 40.0);
}
