import 'package:app_compat_benchmark_core/src/models/shared/required_features.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

abstract class FeatureSupportRequirementsSet {
  RequiredFeatures get requiredFeatures;
  TieredReq get thresholds;
}
